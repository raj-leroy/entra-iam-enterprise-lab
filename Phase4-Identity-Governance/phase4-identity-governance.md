# Phase 4 - Identity Governance (Access Packages)

## Objective
Implement Microsoft Entra Entitlement Management using an access package so a user can request CRM access, an approver can approve, and access is automatically provisioned through group membership.

---

## Environment
Tenant: RL Security Consultant  
Service: Microsoft Entra ID (Identity Governance)  
Feature: Entitlement Management (Access Packages)

---

## Governance Groups
Created governance and app access groups used by the access package workflow.

Evidence:
- S0-governance-groups.png

---

## Access Package Created
Access Package: **AP-CRM-Standard-Access**  
Catalog: **General**  
Resource (Group): **SG-App-CRM-Users** (Member)

Evidence:
- S1-access-package-created.png

---

## Assignment Policy (Access Package Policy)
Policy Name: **Internal-Users-Policy**

Key Settings:
- Who can request: Users in this directory
- Request access: Self-service enabled
- Approval: Required (1 stage)
- Approver group: **SG-App-CRM-Owners**
- Requestor justification: Required
- Assignment duration: 30 days
- Access reviews: Off (lab)

Evidence:
- S2-assignment-policy-enabled.png

---

## Access Request (User)
User: **Alex Johnson**  
Request Method: **My Access (myaccess.microsoft.com)**  
Request Status: **Pending approval**

Evidence:
- S3-admin-view-request-pending.png

---

## Approval Workflow
Approver Action: Approve request in **My Access → Approvals**  
Decision: **Approved**

Evidence:
- S4-approval-pending.png
- S5-approval-complete.png

---

## Provisioning Result (Assignment Delivered)
After approval, Entitlement Management automatically provisioned access by creating an assignment and adding the user to the resource group.

Assignment Status: **Delivered**

Evidence:
- S6-assignment-delivered.png

---

## Verification (Group Membership)
Verified the user received access via group membership.

Group: **SG-App-CRM-Users**  
User: **Alex Johnson**

Evidence:
- S7-group-membership-after-assignment.png

---

## Troubleshooting Note (What Made It Work)
The access package did not appear for Alex in My Access until licensing/entitlement prerequisites were satisfied and changes propagated.
After assigning an appropriate license and confirming Identity Governance configuration, the access package became visible and requestable in My Access.

---

## Skills Demonstrated
- Entra Identity Governance (Entitlement Management)
- Access package design (catalog + resource roles)
- Request/approval workflow configuration
- Automated provisioning to security groups
- Audit-ready access control process
