# Phase 4 – Identity Governance (Entitlement Management)

## Objective

Implement Microsoft Entra Identity Governance using Entitlement Management to automate the provisioning of application access through Access Packages.

This phase demonstrates how organizations provide structured, request-based access to applications using governance workflows instead of manual role assignments.

---

# Environment

Tenant  
RLSecurityConsultant.onmicrosoft.com

Platform  
Microsoft Entra ID

Application  
CRM Enterprise Application

Access Group  
SG-App-CRM-Users

Catalog  
CRM Access Catalog

Access Package  
CRM User Access Package

Reviewer / Administrator  
Rajiv Leroy

Test User  
Alex Johnson

---

# Step 1 – Create Governance Security Group

A security group was created to control access to the CRM application.

Group Name  
SG-App-CRM-Users

Group Type  
Security

Membership Type  
Assigned

This group acts as the access control layer for the CRM enterprise application.

Evidence  
S0-governance-groups.png

---

# Step 2 – Create Access Package

An Access Package was created within the Entitlement Management catalog to allow users to request CRM access.

Access Package Name  
CRM User Access

Catalog  
CRM Access Catalog

Resource Included  
SG-App-CRM-Users

This package defines the access resources users receive when their request is approved.

Evidence  
S1-access-package-created.png

---

# Step 3 – Configure Assignment Policy

An assignment policy was configured to control how users request access.

Policy Settings

Eligible Users  
All Users

Request Approval  
Manager Approval Required

Access Duration  
30 Days

Expiration  
Access Automatically Expires

This policy enforces governance by ensuring access must be requested and approved.

Evidence  
S2-assignment-policy-enabled.png

---

# Step 4 – Admin Review Pending Request

A request was generated for the test user Alex Johnson to obtain CRM access.

Request Status  
Pending Approval

Reviewer  
Rajiv Leroy

The request appeared in the administrator approval queue for validation.

Evidence  
S3-admin-review-request-pending.png

---

# Step 5 – Approve Access Request

The request for Alex Johnson to join the CRM access group was reviewed and approved.

Decision  
Approved

Justification  
User requires CRM access for job responsibilities.

Evidence  
S4-approval-pending.png

---

# Step 6 – Assignment Delivered

Once approved, the access package assignment was delivered to the user.

User Assigned  
Alex Johnson

Resource Granted  
SG-App-CRM-Users

The user now has access to the CRM enterprise application through the governance workflow.

Evidence  
S6-assignment-delivered.png

---

# Step 7 – Verify Group Membership

The user was confirmed as a member of the CRM access group.

Group  
SG-App-CRM-Users

Member  
Alex Johnson

This confirms that the entitlement management workflow successfully provisioned access.

Evidence  
S7-group-membership-assignment.png

---

# Security Concepts Demonstrated

Identity Governance  
Access is requested through a controlled workflow rather than manually assigned.

Least Privilege  
Users receive only the access necessary for their role.

Access Lifecycle Management  
Permissions expire automatically unless renewed.

Approval Workflows  
Managers or administrators must validate access before it is granted.

---

# Result

The CRM application access was successfully governed using Microsoft Entra Entitlement Management.

Users can now request access through the Access Package, approvals are enforced, and permissions are assigned automatically through group membership.
