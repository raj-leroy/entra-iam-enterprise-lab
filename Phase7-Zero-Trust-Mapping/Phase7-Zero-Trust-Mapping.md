# Phase 7 – Zero Trust Architecture Mapping

## Objective

Map the implemented Microsoft Entra identity security controls from previous phases to the Microsoft Zero Trust security framework. Zero Trust assumes that no identity, device, or network location should be inherently trusted. Every authentication attempt must be verified continuously using identity, policy, and risk signals.

This phase documents how each component of the lab environment supports Zero Trust principles.

---

# Zero Trust Model Overview

Microsoft Zero Trust is built around three core principles:

Verify Explicitly  
Use least privilege access  
Assume breach

The identity security architecture implemented in this lab enforces these principles through identity authentication, policy enforcement, governance controls, and monitoring.

---

# Identity Pillar

Identity is the central control plane in the Zero Trust model. All authentication and authorization decisions begin with identity verification.

Implemented Controls

Microsoft Entra ID Tenant  
User Accounts and Security Groups  
Authentication Events and Identity Monitoring

Lab Implementation

Phase1 – Identity Foundation established the tenant and identity structure.

Security Benefit

Every user identity must authenticate before accessing resources.

---

# Conditional Access Enforcement

Conditional Access policies enforce authentication rules based on identity signals such as user risk, device state, location, and authentication strength.

Implemented Controls

Conditional Access Policy  
MFA Enforcement  
Application Access Controls

Lab Implementation

Phase2 – Conditional Access created security policies that evaluate authentication attempts before granting access.

Security Benefit

Access decisions are dynamically enforced rather than statically trusted.

---

# Privileged Access Protection

Privileged accounts represent the highest risk within identity systems. Zero Trust requires strong governance of administrative privileges.

Implemented Controls

Privileged Identity Management (PIM)

Features Demonstrated

Just-in-time privilege activation  
Approval workflows  
Privileged role auditing

Lab Implementation

Phase3 – Privileged Identity Management secured administrative roles using temporary privilege activation.

Security Benefit

Administrators do not maintain permanent privileged access.

---

# Identity Governance

Identity Governance ensures that user access follows a controlled lifecycle and can be requested, approved, reviewed, and revoked.

Implemented Controls

Entitlement Management  
Access Packages  
Approval Workflows

Lab Implementation

Phase4 – Identity Governance implemented access packages that allow users to request CRM application access.

Security Benefit

Access is provisioned through structured workflows instead of manual assignments.

---

# Access Validation

Access Reviews ensure that previously granted permissions remain appropriate.

Implemented Controls

Access Reviews  
Automated Access Removal  
Reviewer Validation

Lab Implementation

Phase5 – Access Reviews validated whether the user Alex Johnson should retain membership in the CRM access group.

Security Benefit

Access permissions are periodically verified and revoked if no longer required.

---

# Monitoring and Detection

Zero Trust requires continuous monitoring of authentication activity and administrative actions.

Implemented Controls

Sign-in Logs  
Audit Logs  
Identity Protection Risk Monitoring

Lab Implementation

Phase6 – Identity Monitoring tracked authentication activity, Conditional Access evaluation, and administrative changes.

Security Benefit

Security teams maintain visibility into identity activity and can detect suspicious behavior.

---

# Zero Trust Security Lifecycle

The lab environment demonstrates the full lifecycle of identity security.

Identity Created  
Phase1 – Identity Foundation

Access Controlled  
Phase2 – Conditional Access

Privileged Roles Protected  
Phase3 – Privileged Identity Management

Access Provisioned Through Governance  
Phase4 – Identity Governance

Access Validated  
Phase5 – Access Reviews

Identity Activity Monitored  
Phase6 – Identity Monitoring

---

# Result

The enterprise identity environment implemented in this lab aligns with Microsoft's Zero Trust architecture.

Authentication, authorization, governance, and monitoring controls work together to ensure that access is verified continuously and privileges remain tightly controlled.

This architecture demonstrates a practical implementation of Zero Trust identity security using Microsoft Entra.
