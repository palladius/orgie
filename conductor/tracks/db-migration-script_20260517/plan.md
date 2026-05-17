# Implementation Plan: Legacy Database Migration Script & Cities

## Phase 1: Database Analysis & Script Preparation
- [ ] Task: Create a base SQL script file (`db/migrate_legacy.sql`).
- [ ] Task: Map all legacy tables and columns to their new English counterparts within the script (using `RENAME TABLE` and `ALTER TABLE`).
- [ ] Task: Identify and script the collation/encoding updates to ensure UTF-8 compatibility for Italian accents.
- [ ] Task: Conductor - User Manual Verification 'Phase 1: Database Analysis & Script Preparation' (Protocol in workflow.md)

## Phase 2: Schema Transformation implementation
- [ ] Task: Implement `ALTER TABLE` commands for `goliardi` to `members`.
- [ ] Task: Implement `ALTER TABLE` commands for `appuntamenti` to `events`, specifically handling the `città` to `city` string attribute mapping.
- [ ] Task: Implement `ALTER TABLE` commands for all other required tables (`canzoni` to `songs`, `cariche` to `roles`, etc.).
- [ ] Task: Implement foreign key renaming to standard `<table_name>_id` conventions.
- [ ] Task: Conductor - User Manual Verification 'Phase 2: Schema Transformation implementation' (Protocol in workflow.md)

## Phase 3: Testing and Verification
- [ ] Task: Load a snapshot of the legacy database into a test environment.
- [ ] Task: Execute the `migrate_legacy.sql` script against the test database.
- [ ] Task: Verify the Rails 8 API can connect and interact with the migrated database without errors.
- [ ] Task: Conductor - User Manual Verification 'Phase 3: Testing and Verification' (Protocol in workflow.md)