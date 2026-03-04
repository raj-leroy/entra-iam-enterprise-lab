# Phase 4 – Microsoft Entra ID Governance (Access Packages)

## Lab Objective
Implement a governed access workflow using Microsoft Entra Entitlement Management where users request access, approvers review requests, and approved users are automatically granted access to resources.

---

# Environment

Tenant: RL Security Consultant  
Platform: Microsoft Entra ID  
Feature Used: Entitlement Management / Access Packages

---

# Access Package

Name: AP-CRM-Standard-Access  
Catalog: General  

Purpose:  
Provide controlled access to CRM resources through an approval workflow.

Resource Assigned:
Security Group: SG-App-CRM-Users

---

# Assignment Policy

Policy Name: Internal-Users-Policy

Request Settings
- Users in directory allowed to request
- Self-service enabled
- Admin assignment allowed

Approval Settings
- Approval required
- 1 approval stage
- Approver group: SG-App-CRM-Owners
- Request justification required
- Decision window: 14 days

Lifecycle
- Access expiration: 30 days
- Access reviews: Disabled for lab

---

# Access Request

User: Alex Johnson  

Request Method:
MyAccess Portal

Justification Submitted:
Access required for CRM operational duties.

Evidence Screenshot:
S3-access-request-pending.png

---

# Approval Workflow

Approver:
Rajiv Leroy

Approval Method:
MyAccess → Approvals

Decision:
Approved

Decision Justification:
Approved for CRM operational duties.

Evidence Screenshots:
S4-approval-pending.png  
S5-approval-complete.png

---

# Assignment Result

After approval the system automatically:

1. Created an access package assignment
2. Added the user to SG-App-CRM-Users
3. Activated entitlement access

Assignment Status:
Delivered

Evidence Screenshot:
S6-assignment-delivered.png

---

# Resource Access Verification

Security Group:
SG-App-CRM-Users

User Added:
Alex Johnson

This confirms automated resource provisioning through the access package workflow.

Evidence Screenshot:
S7-group-membership-after-assignment.png

---

# Governance Outcome

This lab demonstrates a full identity governance lifecycle:

User requests access  
Approver reviews request  
System grants entitlement  
Directory provisions resource access automatically

Security controls enforced:

- Least privilege
- Approval governance
- Automated provisioning
- Audit-ready access management

---

# Skills Demonstrated

Microsoft Entra Identity Governance  
Entitlement Management  
Access Package Design  
Approval Workflows  
Role-Based Access Control (RBAC)  
Identity Lifecycle Management
