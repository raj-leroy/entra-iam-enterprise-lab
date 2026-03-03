# Phase 1: Create Role Groups + Add Members (Graph) with retry for eventual consistency

$TenantDomain = "RLSecurityConsultant.onmicrosoft.com"

function Get-SingleGroupByName {
  param([string]$DisplayName)

  for ($i = 1; $i -le 12; $i++) {
    $g = Get-MgGroup -Filter "displayName eq '$DisplayName'" -All -ConsistencyLevel eventual -ErrorAction SilentlyContinue |
      Select-Object -First 1
    if ($g -and $g.Id) { return $g }
    Start-Sleep -Seconds 5
  }

  return $null
}

function Get-OrCreateSecurityGroup {
  param([string]$DisplayName)

  $existing = Get-SingleGroupByName -DisplayName $DisplayName
  if ($existing -and $existing.Id) { return $existing }

  $body = @{
    displayName     = $DisplayName
    mailEnabled     = $false
    mailNickname    = ($DisplayName -replace '[^a-zA-Z0-9]', '')
    securityEnabled = $true
    groupTypes      = @()
    description     = "Role-mapping security group for $DisplayName"
  }

  $created = New-MgGroup -BodyParameter $body -ErrorAction Stop

  # Re-fetch to ensure Id is hydrated and searchable
  if (-not $created.Id) {
    $created = Get-SingleGroupByName -DisplayName $DisplayName
  } else {
    # Still re-fetch to avoid eventual consistency issues on subsequent lookups
    $created = Get-SingleGroupByName -DisplayName $DisplayName
  }

  if (-not $created -or -not $created.Id) { throw "Group created but not retrievable after retry: $DisplayName" }
  return $created
}

function Add-UserToGroupIfMissing {
  param([string]$GroupId, [string]$UserId)

  if ([string]::IsNullOrWhiteSpace($GroupId)) { throw "GroupId is empty" }
  if ([string]::IsNullOrWhiteSpace($UserId))  { throw "UserId is empty" }

  $members = Get-MgGroupMember -GroupId $GroupId -All -ErrorAction SilentlyContinue
  if ($members.Id -contains $UserId) { return $false }

  New-MgGroupMemberByRef -GroupId $GroupId -BodyParameter @{
    "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$UserId"
  } -ErrorAction Stop | Out-Null

  return $true
}

function Get-UserIdByUpn {
  param([string]$Upn)
  (Get-MgUser -Filter "userPrincipalName eq '$Upn'" -All -ConsistencyLevel eventual -ErrorAction Stop |
    Select-Object -First 1).Id
}

# ===== Create role groups =====
$roleGroups = @(
  "SG-Role-Global-Admin",
  "SG-Role-Application-Admin",
  "SG-Role-User-Admin",
  "SG-Role-Security-Reader"
)

foreach ($rg in $roleGroups) {
  $grp = Get-OrCreateSecurityGroup -DisplayName $rg
  Write-Host "Role group ready: $($grp.DisplayName) ($($grp.Id))"
}

# ===== Add members to role groups (exact mapping) =====
$map = @(
  @{ Group="SG-Role-Global-Admin";       Upns=@("a.johnson@$TenantDomain") },
  @{ Group="SG-Role-Application-Admin";  Upns=@("j.kim@$TenantDomain") },
  @{ Group="SG-Role-User-Admin";         Upns=@("s.patel@$TenantDomain","r.singh@$TenantDomain") },
  @{ Group="SG-Role-Security-Reader";    Upns=@("k.davis@$TenantDomain","o.mitchell@$TenantDomain") }
)

foreach ($m in $map) {
  $gName = $m.Group
  $grp = Get-SingleGroupByName -DisplayName $gName
  if (-not $grp -or -not $grp.Id) { throw "Role group not found after retry: $gName" }

  foreach ($u in $m.Upns) {
    $uid = Get-UserIdByUpn -Upn $u
    $added = Add-UserToGroupIfMissing -GroupId $grp.Id -UserId $uid
    if ($added) { Write-Host "Added $u to $gName" }
    else { Write-Host "Skip (already member): $u -> $gName" }
  }
}

Write-Host "Done. Role groups created and populated."
