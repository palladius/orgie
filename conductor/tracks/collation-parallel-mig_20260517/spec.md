# Specification: Collation Fix & Prefixed Parallel Migration

## Overview
This track refines the database migration strategy by adopting a "prefixed parallel table" approach. This ensures that the original legacy tables remain intact and coexist with the new schema, allowing for safe rollbacks or iterative migrations. Additionally, it addresses broken collation and encoding issues (e.g., `citt` -> `città`) upfront.

## Functional Requirements
- **Pre-process Collation Script**: 
  - Develop a standalone script that reads the raw legacy SQL dump.
  - It must identify and repair broken byte sequences (like ISO-8859-1 accented characters misidentified as Latin1/UTF-8) and output a perfectly formatted UTF-8 SQL file.
- **Prefixed Parallel Tables**:
  - All new tables must use the prefix `gol26a_` (e.g., `gol26a_members`, `gol26a_events`).
  - Legacy tables will remain untouched in the database alongside the new ones.
- **Data Import**:
  - The import process will read from the *cleaned* SQL file and insert the data exclusively into the `gol26a_` prefixed tables.

## Acceptance Criteria
- A pre-processing script successfully converts `citt` to `città` and handles other common Italian accents (è, ì, ò, ù).
- Rails models are configured to use the `gol26a_` table prefix.
- The migration process results in both the legacy tables and the populated `gol26a_` tables existing simultaneously in the database without conflict.

## Out of Scope
- Dropping or deleting the legacy tables (this will happen in a future track once the new system is fully verified).