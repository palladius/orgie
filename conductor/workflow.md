# Conductor Workflow

This document defines the development workflow for the Goliardia Reborn project.

## Core Methodology
- **TDD (Test-Driven Development):** Always write tests before or alongside implementation.
- **Spec-Driven:** Every track must have a clearly defined `spec.md`.
- **Plan-Driven:** Every track must have an `plan.md` that is followed during implementation.

## Phase Completion Protocol
For each phase in a track's `plan.md`, the following must be verified:
1. All tasks and sub-tasks are marked as completed `[x]`.
2. Tests for the functionality are passing.
3. Code adheres to the project's standards (Ruby/Rails for backend, Next.js/TS for frontend).

## Database Standards
- Use English names for tables and columns.
- Follow Rails conventions (e.g., plural table names, `snake_case`).
- Foreign keys should be named `tablename_id`.
