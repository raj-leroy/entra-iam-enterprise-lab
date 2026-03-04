# Phase 3 – Privileged Identity Management (PIM)

## Objective
Implement Just-In-Time (JIT) privileged access for Global Administrator using Microsoft Entra PIM.

## Architecture Decisions
- Converted Global Admin group to Eligible
- Removed permanent active assignment for group
- Configured activation controls:
  - 1-hour maximum duration
  - MFA required
  - Justification required
  - Approval required
- BreakGlass account retained as permanent active (emergency access)

## Implementation Summary
- RAG-Global-Admin group set to permanently eligible
- Activation requires approval from designated approver
- Alex Johnson tested JIT activation workflow
- Approval processed by primary administrator
- Audit logs verified activation and approval events

## Security Rationale
- Eliminates standing privilege
- Enforces time-bound elevation
- Requires accountability and traceability
- Aligns with Zero Trust least privilege principles

## Evidence
See /screenshots folder for:
S1 – Eligible assignment
S2 – Role activation settings
S3 – Activation request (Pending)
S4 – Approval
S5 – JIT approved
S6 – Audit log
