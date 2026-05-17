# Product Definition: Goliardia Reborn

## Vision
Migrate the legacy PHP 5.5 Goliardia site to a modern, highly interactive, and visually stunning web application hosted on Google Cloud Platform (GCP).

## Key Capabilities
- **Lift and Shift:** Port all legacy PHP functionalities to the new modern stack.
- **Prefixed Parallel Migration:** Migrate the legacy database using a "prefixed parallel table" approach (e.g., `gol26a_users`). This allows the legacy tables to coexist with the new English Rails-style schema for safe iteration and rollback.
- **Image Management:** Users can upload images (PII/personal pictures), which are stored safely in Google Cloud Storage (GCS).
- **Email System:** Robust email sending functionality for notifications and user engagement.
- **Modern UI:** "Wow" effect UI leveraging modern JavaScript/TypeScript frameworks and Tailwind CSS.
