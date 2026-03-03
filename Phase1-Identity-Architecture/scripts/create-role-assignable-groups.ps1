# Create role-assignable groups (required for Entra role assignment)
# Requires: Group.ReadWrite.All, Directory.ReadWrite.All

function Get-GroupByName {
  param([string]$DisplayName)
  Get-MgGroup -Filter "displayName eq '$DisplayName'" -All -ConsistencyLevel eventual -ErrorAction SilentlyContinue |
    Select-Object -First 1
}

function New-RoleAssignableGroup {
  param([string]$DisplayName)

  $existing = Get-GroupByName -DisplayName $DisplayName
  if ($existing -and $existing.Id) {
    Write-Host "SKIP: exists $DisplayName ($($existing.Id))"
    return $existing
  }

  $body = @{
    displayName        = $DisplayName
    description        = "Role-assignable group for $DisplayName"
    mailEnabled        = $false
    mailNickname       = ($DisplayName -replace '[^a-zA-Z0-9]', '')
    securityEnabled    = $true
    groupTypes         = @()
    isAssignableToRole = $true
  }

  $g = New-MgGroup -BodyParameter $body -ErrorAction Stop
  Write-Host "CREATED: $DisplayName ($($g.Id))"
  $g
}

$targets = @(
  "RAG-Global-Admin",
  "RAG-Application-Admin",
  "RAG-User-Admin",
  "RAG-Security-Reader"
)

foreach ($t in $targets) {
  New-RoleAssignableGroup -DisplayName $t | Out-Null
}

Write-Host "Done. Role-assignable groups created."
