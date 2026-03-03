# Assign Entra directory roles to ROLE-ASSIGNABLE groups (RAG-*) (Group-based RBAC)
# Requires Graph scope: RoleManagement.ReadWrite.Directory

function Get-RoleDefinitionId {
  param([string]$RoleDisplayName)

  $r = Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq '$RoleDisplayName'" -All -ErrorAction Stop |
    Select-Object -First 1

  if (-not $r -or -not $r.Id) { throw "Role definition not found: $RoleDisplayName" }
  $r.Id
}

function Get-GroupId {
  param([string]$GroupDisplayName)

  $g = Get-MgGroup -Filter "displayName eq '$GroupDisplayName'" -All -ConsistencyLevel eventual -ErrorAction Stop |
    Select-Object -First 1

  if (-not $g -or -not $g.Id) { throw "Group not found: $GroupDisplayName" }
  $g.Id
}

function Ensure-RoleAssignmentToGroup {
  param(
    [string]$RoleDisplayName,
    [string]$GroupDisplayName
  )

  $roleDefId = Get-RoleDefinitionId -RoleDisplayName $RoleDisplayName
  $groupId   = Get-GroupId -GroupDisplayName $GroupDisplayName

  # Check if assignment already exists
  $existing = Get-MgRoleManagementDirectoryRoleAssignment -Filter "roleDefinitionId eq '$roleDefId'" -All -ErrorAction SilentlyContinue |
    Where-Object { $_.PrincipalId -eq $groupId }

  if ($existing) {
    Write-Host "SKIP: $RoleDisplayName already assigned to $GroupDisplayName"
    return
  }

  New-MgRoleManagementDirectoryRoleAssignment -BodyParameter @{
    principalId      = $groupId
    roleDefinitionId = $roleDefId
    directoryScopeId = "/"
  } -ErrorAction Stop | Out-Null

  Write-Host "ASSIGNED: $RoleDisplayName -> $GroupDisplayName"
}

# NOTE: These MUST be role-assignable groups (isAssignableToRole = true)
Ensure-RoleAssignmentToGroup -RoleDisplayName "Global Administrator"      -GroupDisplayName "RAG-Global-Admin"
Ensure-RoleAssignmentToGroup -RoleDisplayName "Application Administrator" -GroupDisplayName "RAG-Application-Admin"
Ensure-RoleAssignmentToGroup -RoleDisplayName "User Administrator"        -GroupDisplayName "RAG-User-Admin"
Ensure-RoleAssignmentToGroup -RoleDisplayName "Security Reader"           -GroupDisplayName "RAG-Security-Reader"
