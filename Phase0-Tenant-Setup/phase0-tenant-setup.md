# Phase 0 – Tenant Setup

## Objective

Establish a Microsoft Entra tenant to serve as the identity control plane for the enterprise IAM lab environment.  
This tenant will host all identity objects, authentication policies, governance controls, and monitoring capabilities implemented throughout the lab.

The goal of this phase is to create a secure identity foundation that supports enterprise identity architecture and Zero Trust security principles.

---

# Environment

Cloud Platform  
Microsoft Azure

Identity Platform  
Microsoft Entra ID

Tenant Name  
RLSecurityConsultant.onmicrosoft.com

Primary Administrator  
Rajiv Leroy

Licensing  
Microsoft 365 E5 (Microsoft Entra ID P2)

Purpose  
Enterprise IAM architecture lab environment

---

# Tenant Creation

The tenant was created using the Microsoft Azure portal by provisioning a new Microsoft Entra ID directory.

Navigation

Azure Portal  
Microsoft Entra ID  
Manage Tenants  
Create Tenant

Tenant Configuration

Directory Type  
Microsoft Entra ID

Organization Name  
RL Security Consultant

Initial Domain Name  
rlsecurityconsultant.onmicrosoft.com

Region  
United States

After creation, the tenant became the centralized identity provider for the lab environment.

---

# Initial Administrative Configuration

After tenant creation, the primary administrator account was configured to manage the identity environment.

Administrator Account

Name  
Rajiv Leroy

Role  
Global Administrator

Responsibilities

Tenant administration  
Security policy management  
Identity governance configuration  
Audit and monitoring oversight

Global Administrator privileges were used only for configuration tasks and later protected using Privileged Identity Management.

---

# Licensing Configuration

To enable advanced identity security capabilities, Microsoft Entra ID P2 licensing was applied.

Licensing Plan

Microsoft 365 E5

Key Capabilities Enabled

Conditional Access  
Privileged Identity Management  
Identity Governance  
Access Reviews  
Identity Protection  
Sign-in and Audit Logging

These features enable the implementation of modern enterprise IAM architecture.

---

# Tenant Security Baseline

Before implementing identity policies, the tenant was configured with a basic security baseline.

Baseline Configuration

Administrative role separation  
Structured identity attributes  
Security group framework  
Privileged role monitoring

This baseline ensures the environment is ready for policy enforcement and governance controls.

---

# Identity Architecture Preparation

The tenant was prepared to support enterprise identity architecture.

Preparation Tasks

User identity structure planning  
Security group naming standards  
Role-based access design  
Application access segmentation

These structures support scalable identity governance and policy enforcement.

---

# Zero Trust Alignment

The tenant was designed following Microsoft’s Zero Trust identity principles.

Verify Explicitly  
Every authentication request must be validated.

Least Privilege  
Users receive only the permissions required for their role.

Assume Breach  
Identity activity must be continuously monitored.

Microsoft Entra serves as the identity control plane enforcing these principles.

---

# Result

The Microsoft Entra tenant was successfully created and configured as the identity foundation for the IAM enterprise lab.

This tenant now hosts all identity security controls implemented in later phases, including Conditional Access, Privileged Identity Management, Identity Governance, Access Reviews, and identity monitoring.
