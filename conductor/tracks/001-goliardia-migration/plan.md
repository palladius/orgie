# Implementation Plan: Goliardia Migration Discovery

## Phase 1: Repository Consolidation
1. **[x]** Identify all repositories on GitHub.
2. **[x]** Create local directory: `~/git/projects/goliardia26/`
3. **[x]** Clone all identified repositories into the new directory.

## Phase 2: Legacy Code Audit
1. **[x]** Scan for PHP 5.5 files and map out dependencies.
2. **[x]** Document core functionalities to be ported.
3. **[x]** Locate and catalog all images/media assets for GCS migration.

## Phase 3: Tech Stack Finalization
1. **[x]** Compare Next.js vs. Rails 8 for performance/cost on GCP.
2. **[x]** Design the "Wow UI" architecture using Tailwind CSS and modern JS/TS libraries.
3. **[x]** Finalize the GCP architecture (Cloud Run, GCS, Cloud SQL).

## Phase 4: Database Mapping & Translation
1. [ ] Map existing Italian/accented table and column names to English counterparts.
2. [ ] Define the transformation logic for the legacy PII data.
3. [ ] Create a migration script to normalize the schema to Rails-style conventions.

## Phase 5: Infrastructure & Storage Setup
1. [ ] Configure Dockerfile for GCS FUSE mount support on Cloud Run.
2. [ ] Set up local development environment with symlinks for image assets.
3. [ ] Define GCS bucket structure and IAM permissions for the mount.
