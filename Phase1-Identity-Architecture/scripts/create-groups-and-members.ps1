$TenantDomain = "RLSecurityConsultant.onmicrosoft.com"

$deptGroups = @(
  @{ Name="SG-Dept-Executive"; Dept="Executive" },
  @{ Name="SG-Dept-HR";       Dept="HR" },
  @{ Name="SG-Dept-Finance";  Dept="Finance" },
  @{ Name="SG-Dept-IT";       Dept="IT" },
  @{ Name="SG-Dept-Security"; Dept="Security" },
  @{ Name="SG-Dept-Sales";    Dept="Sales" }
)

function Get-SingleGroupByName {
  param([string]$DisplayName)

  $g = Get-MgGroup -Filter "displayName eq '$DisplayName'" -All -ConsistencyLevel eventual -ErrorAction SilentlyContinue |
       Select-Object -First 1

  return $g
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
    description     = "Department security group for $DisplayName"
  }

  $created = New-MgGroup -BodyParameter $body -ErrorAction Stop
  if (-not $created.Id) { throw "Group created but Id was empty for $DisplayName" }
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

foreach ($g in $deptGroups) {
  $groupName = $g.Name
  $dept = $g.Dept

  $group = Get-OrCreateSecurityGroup -DisplayName $groupName
  if (-not $group.Id) { throw "No group Id returned for $groupName" }

  Write-Host "Group ready: $groupName ($($group.Id))"

  $users = Get-MgUser -Filter "department eq '$dept'" -All -ConsistencyLevel eventual -ErrorAction Stop

  foreach ($u in $users) {
    $added = Add-UserToGroupIfMissing -GroupId $group.Id -UserId $u.Id
    if ($added) { Write-Host "  Added: $($u.UserPrincipalName)" }
  }
}

Write-Host "Done. Department groups created and populated."
