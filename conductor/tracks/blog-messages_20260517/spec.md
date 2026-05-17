# Specification: Blog & Messages (Contents) Feed

## Overview
This track implements the "Blog & Messages" feature, migrating the legacy `contenuti` (now mapped to the `gol26a_contents` table) into a modern, read-only feed on the Next.js frontend. The UI will prioritize a "wow" visual experience using a masonry grid layout.

## Functional Requirements
- **Backend API**:
  - Implement a `ContentsController` that serves data from the `gol26a_contents` table.
  - The API should include the associated author (`Goliarda` model) for each content piece.
- **Frontend UI (Next.js)**:
  - Create a new `/blog` (or `/messages`) page.
  - Display the contents using a dynamic, visually appealing **Masonry Grid** layout.
  - Implement basic **Text Search** functionality to filter the masonry grid based on content titles or bodies.
  - The UI will be strictly **Read-Only** for this phase (the post-creation interface is deferred).
  - The legacy `is_serious` flag will be ignored for now; all content will be displayed uniformly.
- **Authentication**:
  - Login requirements are explicitly disabled. The feed and search functionalities are publicly accessible for convenience and testing.

## Acceptance Criteria
- A user can navigate to the Blog/Messages page and see a populated masonry grid of legacy contents.
- The grid visually adapts to different screen sizes.
- Text search correctly filters the displayed items in real-time.
- The page does not require a user to log in or authenticate.

## Out of Scope
- Creating, editing, or deleting contents (Read-Only mode).
- Advanced filtering (e.g., by author, date, or "serious" status).
- Full user authentication/authorization systems.