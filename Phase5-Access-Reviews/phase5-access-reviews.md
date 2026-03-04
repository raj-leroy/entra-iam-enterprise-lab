# Phase 5 - Identity Governance Access Reviews

## Objective

Implement Identity Governance Access Reviews in Microsoft Entra ID to validate that users maintain appropriate access to critical resources and privileged roles. This phase demonstrates how organizations periodically review access to reduce privilege creep and maintain least-privilege security posture.

Access Reviews are a core governance control within Zero Trust architecture and help ensure that access granted through groups, roles, or applications remains justified over time.

---

## Environment

Tenant: RLSecurityConsultant.onmicrosoft.com  
Platform: Microsoft Entra ID  
Primary Test User: Alex Johnson  
Reviewer: Rajiv Leroy (Global Administrator)

---

## Implementation Steps

### Step 1 – Navigate to Access Reviews

In Microsoft Entra Admin Center:

Identity Governance  
→ Access Reviews  
→ New Access Review

This begins configuration of an automated review process for user access.

---

### Step 2 – Configure Review Scope

The access review was configured to evaluate membership within the application access group associated with the CRM access package created in Phase 4.

Scope Selected:

Group Membership Review

Target Group:

SG-App-CRM-Users

This group controls access to the CRM application environment through Entitlement Management.

---

### Step 3 – Configure Review Settings

The following review parameters were configured:

Review Name  
CRM Access Review

Review Type  
Group Membership

Reviewer  
Rajiv Leroy

Review Duration  
7 Days

Review Frequency  
One-time review (Lab simulation)

Review Decision Required  
Yes

If reviewers do not respond  
Remove access

Justification Required  
Enabled

These settings simulate a real enterprise governance workflow where access must be justified and validated by designated reviewers.

---

### Step 4 – Start Access Review

After configuration was completed, the review was initiated.

The review system automatically evaluated members of the target group and assigned the reviewer responsible for validating continued access.

Active Review Target:

User: Alex Johnson

The review was launched successfully and appeared in the Access Reviews dashboard.

---

### Step 5 – Perform Review Decision

The reviewer navigated to the active review and evaluated the access assigned to Alex Johnson.

Review Decision:

Approved

Justification:

User requires continued access to the CRM environment for standard operational responsibilities.

The approval confirms that the user’s access remains valid and necessary.

---

## Evidence Collected

Screenshots captured during this phase:

S1 – Access Review creation configuration  
S2 – Review scope and reviewer configuration  
S3 – Active review listing in Access Reviews dashboard  
S4 – Review decision interface for Alex Johnson  
S5 – Final approved review result

These screenshots provide verifiable proof that governance reviews were configured and executed successfully.

---

## Security Concepts Demonstrated

Least Privilege

Users only retain access that has been validated during periodic reviews.

Access Governance

Regular validation of user permissions prevents unnecessary privilege accumulation.

Separation of Duties

Review decisions require oversight from authorized reviewers rather than automated permanent approval.

Zero Trust Alignment

Access must be continuously verified rather than assumed permanent.

---

## Operational Value

Access Reviews help organizations:

Prevent privilege creep  
Validate access after role changes  
Detect unnecessary access assignments  
Maintain compliance with governance policies

Organizations commonly use Access Reviews to audit:

Privileged roles  
Application access groups  
External guest user access  
Departmental resource groups

---

## Result

The Access Review was successfully configured and executed for the CRM application access group.

Alex Johnson's membership in the CRM access group was reviewed and approved, confirming that access remains appropriate.

This phase demonstrates how Microsoft Entra Identity Governance enables automated lifecycle management of user access in enterprise environments.

---

## Next Phase

Phase 6 will capture audit evidence from Microsoft Entra logs to demonstrate monitoring and traceability of identity governance activities.

This includes:

Audit Logs  
Access Review Activity Logs  
Access Package Assignment Logs
