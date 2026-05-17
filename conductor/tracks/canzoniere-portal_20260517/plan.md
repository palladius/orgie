# Implementation Plan: Canzoniere (Songs) Portal

## Phase 1: Backend API Development
- [ ] Task: Create `SongsController` with an `index` action to return `gol26a_songs` data.
- [ ] Task: Write tests for `SongsController` ensuring it returns the expected JSON structure (TDD).
- [ ] Task: Update `config/routes.rb` to ensure the `/songs` API endpoint is correctly mapped (already done in previous track, just verify).
- [ ] Task: Conductor - User Manual Verification 'Phase 1: Backend API Development' (Protocol in workflow.md)

## Phase 2: Frontend Split-Pane Layout
- [ ] Task: Create the `src/app/canzoniere/page.tsx` component.
- [ ] Task: Create API fetching logic in `src/lib/api.ts` to retrieve songs from the backend (`fetchSongs`).
- [ ] Task: Implement the base Split Pane layout (using Tailwind grid/flexbox) with a scrollable list on the left and an empty reading pane on the right.
- [ ] Task: Conductor - User Manual Verification 'Phase 2: Frontend Split-Pane Layout' (Protocol in workflow.md)

## Phase 3: Functionality & Refinement
- [ ] Task: Add a text search input to filter the left pane's list by title and body.
- [ ] Task: Implement state management so clicking a song in the left pane displays its details (Title, Author, Body) in the right pane.
- [ ] Task: Apply modern sans-serif typography and `whitespace-pre-wrap` styling to the lyrics body to respect legacy line breaks.
- [ ] Task: Conductor - User Manual Verification 'Phase 3: Functionality & Refinement' (Protocol in workflow.md)