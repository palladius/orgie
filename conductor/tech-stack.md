# Tech Stack

## Infrastructure
- **Hosting:** Google Cloud Platform (GCP)
- **Object Storage:** Google Cloud Storage (GCS) for user-uploaded images

## Frontend
- **Framework:** Modern JS/TS framework (React/Next.js or Vue/Nuxt) for a "wow" UI effect.
- **Styling:** Tailwind CSS

## Finalized Tech Stack Recommendation

### Infrastructure
- **Hosting:** Google Cloud Platform (GCP)
  - **Cloud Run:** For both Backend and Frontend.
  - **Cloud SQL (PostgreSQL):** Robust relational data storage.
  - **Storage (GCS Fuse Mount):** Images will be accessed via **Cloud Run GCS FUSE mounts**. This allows the application to treat GCS as a local file system (`/mnt/gcs/images`), minimizing dependencies on GCS SDKs.
- **Local Development:** Images will be handled via **symlinks** to a local assets folder, mirroring the mount path for environment parity.
- **Email:** SendGrid or Mailgun integration via Rails Action Mailer.

### Backend: Ruby on Rails 8 (API Mode)
- **Rationale:** Optimized for "lift and shift" of complex legacy schemas. Active Record provides the best tools for the requested database translation and English-normalization.
- **Prefix Strategy:** All new tables use the `gol26a_` prefix (configured via `self.table_name_prefix`) to allow parallel existence with legacy tables.
- **Performance:** Leveraging Rails 8's internal optimizations (Solid Cache/Queue).
- **Cost:** Balanced by significantly reduced development hours due to superior migration tools.

### Frontend: Next.js (TypeScript)
- **Rationale:** Delivers the "Wow UI" effect with high performance, React Server Components, and seamless animations (Framer Motion).
- **Styling:** Tailwind CSS + Headless UI / Shadcn UI.
