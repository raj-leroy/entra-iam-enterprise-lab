# S4 – Microsoft Graph Password Reset Test

## Objective
Validate ability to reset a user password using Microsoft Graph PowerShell under enforced Conditional Access policies.

---

## Initial Attempt

### Command Used
```powershell
Update-MgUser -UserId <UserId> -PasswordProfile @{
  Password = "TempUserP@ss2026!"
  ForceChangePasswordNextSignIn = $true
}
Result

403 Authorization_RequestDenied

Error Summary

Insufficient privileges to complete the operation.

Root Cause Analysis

RBAC roles were confirmed active:

Global Administrator (Active)

Privileged Authentication Administrator (Active)

Scopes initially present:

Directory.ReadWrite.All

User.ReadWrite.All

Issue determined to be missing effective delegated scope for password reset operation.

Remediation

Reconnected to Microsoft Graph with required delegated scope:

Connect-MgGraph -TenantId "<TenantId>" -Scopes "User.ReadWrite.All","Directory.AccessAsUser.All"

Verified scopes:

Get-MgContext | Select-Object Account,TenantId,Scopes

Confirmed:

Directory.AccessAsUser.All present

Successful Password Reset
Update-MgUser -UserId <UserId> -PasswordProfile @{
  Password = "TempUserP@ss2026!"
  ForceChangePasswordNextSignIn = $true
}
Result

Success (no error returned)
