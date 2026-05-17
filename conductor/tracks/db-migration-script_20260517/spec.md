# Specification: Legacy Database Migration Script & Cities

## Overview
This track focuses on creating a robust SQL migration script to transform the legacy Goliardia MySQL database (with Italian naming conventions) into the new English-based, Rails-standard schema. It also ensures the inclusion of "City" data as a string attribute across relevant entities.

## Functional Requirements
- **Raw SQL Migration Script**: Develop a script that:
  - Takes a backup of the existing MySQL database.
  - Renames tables and columns from Italian to English (e.g., `goliardi` -> `members`).
  - Normalizes foreign keys to the `<table_name>_id` format.
  - Sets appropriate collations (e.g., UTF-8) to handle legacy accented characters.
- **City Data Integration**: Ensure that "City" data (e.g., `città`) is properly migrated and mapped to a simple string attribute (`city`) on relevant tables like `events` and `hat_colors`.

## Acceptance Criteria
- A raw SQL script exists that successfully transforms a snapshot of the legacy database into the new schema structure.
- The new database can be used seamlessly by the Rails 8 API.
- All "City" data is correctly preserved and accessible via string attributes.
- Collations and encodings are handled without data loss or corruption for accented Italian words.

## Out of Scope
- Creating a dedicated `City` table or model.
- Migrating binary file assets (images) directly within the SQL script (this is handled via GCS Fuse mounts).