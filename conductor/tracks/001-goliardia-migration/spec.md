# Specification: Goliardia Migration Discovery

## Goal
The goal of this track is to consolidate all existing Goliardia-related code and legacy assets, identify all functionalities that need to be "lifted and shifted", and finalize the tech stack for the new implementation.

## Requirements
- **Repository Discovery:** Search for all `goliardia` and `orgie` repositories under the `palladius` GitHub user.
- **Local Consolidation:** Clone all identified repositories into `~/git/projects/goliardia26/` for deep analysis.
- **Legacy Analysis:** Audit the PHP 5.5 code for:
  - Database schema and models.
  - Core business logic (Goliardia hierarchies, tree structures).
  - UI/UX patterns.
  - Static assets (PII/personal pictures).
- **GCP Mapping:** Define the GCS bucket structure for images and the email delivery service (e.g., SendGrid on GCP or Cloud Run with SMTP).
