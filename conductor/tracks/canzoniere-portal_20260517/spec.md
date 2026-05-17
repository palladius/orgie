# Specification: Canzoniere (Songs) Portal

## Overview
This track implements the "Canzoniere" feature, a digital songbook for the Goliardia Reborn platform. It will expose the legacy songs (mapped to `gol26a_songs`) through a modern, split-pane user interface designed for readability and rapid searching.

## Functional Requirements
- **Backend API**:
  - Implement a `SongsController` serving data from the `gol26a_songs` table.
  - API endpoints must support efficient querying of both titles and full lyrics.
- **Frontend UI (Next.js)**:
  - Create a new `/songs` (or `/canzoniere`) page.
  - Implement a **Split Pane** layout:
    - **Left Pane:** A scrollable list of song titles and authors.
    - **Right Pane:** A dedicated reading area for the selected song's lyrics.
  - Implement a robust **Search functionality** that filters the list by matching either the song title or the lyrics body in real-time.
  - Use a **Modern Sans-Serif** typography for the lyrics to ensure a clean and highly legible reading experience.
  - The UI remains Read-Only for this phase.

## Acceptance Criteria
- A user can navigate to the Canzoniere page and view the split-pane interface.
- Clicking a song in the left list immediately displays its lyrics in the right pane.
- Typing in the search bar instantly filters the list of songs on the left based on matches in the title or the lyrics.
- The lyrics are presented with clear, modern sans-serif typography, properly handling line breaks (`\n`) for verses.

## Out of Scope
- Adding, editing, or deleting songs.
- Audio playback or integration with external music services (e.g., YouTube links embedded in notes).