# Microsoft Entra IAM Enterprise Lab

Tenant: RLSecurityConsultant.onmicrosoft.com

This lab demonstrates enterprise Identity and Access Management architecture built with Microsoft Entra ID. The environment simulates how organizations secure identities using Conditional Access, Privileged Identity Management, Identity Governance, Access Reviews, and identity monitoring aligned with Zero Trust principles.

---

# Lab Architecture

This project implements the full lifecycle of identity security in Microsoft Entra.

Identity Creation → Access Control → Privileged Access → Governance → Access Validation → Monitoring

The lab environment demonstrates how authentication, authorization, governance, and monitoring operate together to secure enterprise identities.

---

# Lab Phases

## Phase 1 – Identity Architecture & RBAC Design

Enterprise users were provisioned and organized using structured attributes and security groups to enable role-based access control.

Key Concepts

• User provisioning  
• Identity attributes  
• Security groups  
• Group-based RBAC

Location

Phase1-Identity-Architecture/

---

## Phase 2 – Conditional Access Architecture

Conditional Access policies were implemented to enforce authentication security requirements across the tenant.

Key Concepts

• Multi-factor authentication enforcement  
• Conditional Access policy evaluation  
• Secure authentication flows

Location

Phase2-Conditional-Access/

---

## Phase 3 – Privileged Identity Management (PIM)

Administrative roles were secured using Microsoft Entra Privileged Identity Management.

Key Concepts

• Just-in-time privilege elevation  
• Approval workflows  
• Privileged role auditing

Location

Phase3-PIM/

---

## Phase 4 – Identity Governance (Entitlement Management)

Identity Governance was implemented using Entitlement Management and Access Packages to control application access.

Key Concepts

• Access Packages  
• Access request workflows  
• Approval policies  
• Automated group membership assignment

Location

Phase4-Identity-Governance/

---

## Phase 5 – Access Reviews

Access Reviews were configured to periodically validate user access to application resources.

Key Concepts

• Group access validation  
• Reviewer approval workflows  
• Automated access removal

Location

Phase5-Access-Reviews/

---

## Phase 6 – Identity Monitoring and Logging

Identity monitoring capabilities were implemented using Microsoft Entra logs and security dashboards.

Key Concepts

• Sign-in log monitoring  
• Audit log analysis  
• Conditional Access evaluation  
• Identity Protection risk monitoring

Location

Phase6-Identity-Monitoring/

---

## Phase 7 – Zero Trust Architecture Mapping

The implemented security controls were mapped to Microsoft's Zero Trust architecture model.

Key Concepts

• Verify explicitly  
• Use least privilege  
• Assume breach

Location

Phase7-Zero-Trust-Mapping/

---

# Security Principles Demonstrated

Least Privilege  
Group-based RBAC  
Conditional Access enforcement  
Just-in-time privilege elevation  
Identity Governance  
Access lifecycle validation  
Identity monitoring  
Zero Trust architecture

---

# Licensing Used

Microsoft Entra ID P2  
(Microsoft 365 E5)

---

# Result

This lab demonstrates how enterprise organizations secure identity infrastructure using Microsoft Entra.

The environment includes authentication controls, privileged access protection, governance workflows, periodic access validation, and identity monitoring aligned with Zero Trust principles.
