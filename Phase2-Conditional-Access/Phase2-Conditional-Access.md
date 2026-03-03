# Phase 2 – Conditional Access Architecture

## Objective
Implement organization-wide MFA enforcement using Conditional Access with location-based logic and administrative privilege hardening.

## Architecture Decisions
- Created Named Location for United States
- Baseline MFA policy applied to all users
- US location excluded to simulate geo-based access model
- Separate hardened admin policy applied to privileged roles
- Report-only validation performed before enforcement

## Policies Implemented
1. CA-Require-MFA-All-Users
   - Applies to all users
   - Excludes US named location
   - Requires MFA
   - Enforced

2. CA-Admins-Require-MFA-AnyLocation
   - Applies to privileged roles
   - Requires MFA from any location
   - Enforced

## Security Rationale
- Protects against credential compromise
- Reduces attack surface via geo-conditional logic
- Separates administrative risk from standard user access
- Validated via sign-in logs before production enforcement

## Evidence
See /screenshots folder for:
S1 – Named location
S2 – Baseline policy report-only validation
S3 – Admin policy report-only validation
S4 – Admin policy enforced
S5 – Baseline policy enforced
