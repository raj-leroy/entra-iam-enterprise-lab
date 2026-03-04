# Phase 5 – Access Reviews (Identity Governance)

## Objective

Implement Microsoft Entra Access Reviews to validate whether users should retain access to sensitive resources. Access Reviews allow organizations to periodically confirm that users still require assigned permissions and remove access that is no longer necessary.

This phase demonstrates governance controls used to maintain least-privilege access after permissions have already been granted.

---

# Environment

Tenant  
RLSecurityConsultant.onmicrosoft.com

Platform  
Microsoft Entra ID

Resource Being Reviewed  
SG-App-CRM-Users

Test User  
Alex Johnson

Reviewer  
Rajiv Leroy

---

# Step 1 – Configure Access Review Scope

An Access Review was created targeting the CRM access group.

Resource Type  
Teams + Groups

Group Selected  
SG-App-CRM-Users

Scope  
All Users

This configuration ensures that every user who currently has CRM access is included in the review.

Evidence  
S1-access-review-scope.png

---

# Step 2 – Configure Reviewers

The review process was configured so the group owner would perform the review.

Reviewer Configuration

Primary Reviewer  
Group Owner(s)

Fallback Reviewer  
Rajiv Leroy

This ensures that resource owners validate whether access remains appropriate.

Evidence  
S2-reviewer-configuration.png

---

# Step 3 – Configure Access Review Settings

Governance settings were configured to automate enforcement of review decisions.

Auto Apply Results to Resource  
Enabled

If Reviewers Do Not Respond  
Remove Access

Decision Helper  
No Sign-in Within 30 Days

Justification Required  
Enabled

Email Notifications  
Enabled

Reminders  
Enabled

These controls simulate enterprise governance policies where stale access is automatically removed if not reviewed.

Evidence  
S3-access-review-settings.png

---

# Step 4 – Create Access Review

The access review configuration was finalized and created.

Review Name  
CRM Users Access Review

Review Duration  
3 Days

Review Type  
One-Time Review

Target Resource  
SG-App-CRM-Users

After creation, the review appeared in the Access Reviews dashboard.

Evidence  
S4-access-review-created.png

---

# Step 5 – Perform Access Review Decision

The reviewer evaluated access for the test user Alex Johnson.

System Recommendation  
Deny (user inactive)

Reviewer Decision  
Approved

Justification  
User requires CRM access for assigned job responsibilities.

Evidence  
S5-access-review-decision-screen.png

---

# Step 6 – Review Result Recorded

After submitting the review decision, the outcome was recorded in the Access Review results page.

User Reviewed  
Alex Johnson

Outcome  
Approved

Reviewed By  
Rajiv Leroy

Evidence  
S6-access-review-approved.png

---

# Security Concepts Demonstrated

Access Governance  
Periodic validation ensures users only retain necessary permissions.

Least Privilege  
Access is continuously reviewed to prevent privilege creep.

Zero Trust Security  
Access must be verified regularly instead of assumed permanent.

Identity Lifecycle Management  
User permissions are monitored throughout their lifecycle.

---

# Result

The CRM access group was successfully placed under a Microsoft Entra Access Review.

Alex Johnson's membership was reviewed and approved, demonstrating the full governance lifecycle where access is provisioned through Entitlement Management and later validated through Access Reviews.
