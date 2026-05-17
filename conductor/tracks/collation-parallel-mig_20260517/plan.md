# Implementation Plan: Collation Fix & Prefixed Parallel Migration

## Phase 1: Collation Pre-processing Script
- [x] Task: Create a Ruby script (`bin/clean_collation.rb`) that reads an input SQL file.
- [x] Task: Implement byte-mapping logic to find and replace broken ISO-8859-1 accented characters (like `` or `Ã¨`) with proper UTF-8 equivalents (`à`, `è`, `é`, `ì`, `ò`, `ù`).
- [x] Task: Run the script against the legacy dump to generate a clean `db/opengoliardia_clean.sql` file.
- [x] Task: Conductor - User Manual Verification 'Phase 1: Collation Pre-processing Script' (Protocol in workflow.md)

## Phase 2: Parallel Schema Configuration
- [x] Task: Update the base Rails configuration (or individual models) to use `gol26a_` as the table name prefix (e.g., `self.table_name_prefix = 'gol26a_'`).
- [x] Task: Update the existing Rails migration files to explicitly create tables with the `gol26a_` prefix (or ensure the global prefix setting handles it during migration).
- [x] Task: Run `rails db:migrate` to generate the new schema alongside the untouched legacy tables (if any were copied over, though locally we are just creating the new ones).
- [x] Task: Conductor - User Manual Verification 'Phase 2: Parallel Schema Configuration' (Protocol in workflow.md)

## Phase 3: Import Task Refinement
- [x] Task: Update the `rake migrate:legacy` task to point to the newly generated `db/opengoliardia_clean.sql` file.
- [x] Task: Ensure the Rake task continues to map the legacy table names (e.g., `goliardi`) in the SQL `INSERT` statements to the new Active Record models (which now map to `gol26a_members`).
- [x] Task: Execute the import task and verify data integrity (especially cities and accented fields).
- [x] Task: Conductor - User Manual Verification 'Phase 3: Import Task Refinement' (Protocol in workflow.md)