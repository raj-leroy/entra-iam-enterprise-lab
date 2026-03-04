# Microsoft Entra IAM Architecture

This lab implements an enterprise Identity and Access Management architecture using Microsoft Entra ID aligned with Zero Trust principles.

flowchart TD

User[User Identity]

User --> CA[Conditional Access]
CA --> MFA[MFA Enforcement]

MFA --> RBAC[Group-Based RBAC]

RBAC --> PIM[Privileged Identity Management]

PIM --> GOV[Identity Governance<br>Access Packages]

GOV --> REV[Access Reviews]

REV --> MON[Identity Monitoring<br>Sign-in Logs / Audit Logs]

MON --> ZT[Zero Trust Identity Architecture]
