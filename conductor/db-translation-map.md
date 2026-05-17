# Database Translation Map: Italian to English

This document maps the legacy Goliardia (PHP/MySQL) schema to the new modern English (Rails-style) schema.

## Core Tables

| Legacy Table | New Table (English) | Notes |
|---|---|---|
| `appuntamenti` | `events` / `appointments` | Meetings, parties, etc. |
| `canzoni` | `songs` | Lyrics, authors. |
| `cariche` | `roles` / `positions` | Hierarchical roles in orders. |
| `colorefeluca` | `hat_colors` | Traditional goliardia colors. |
| `contenuti` | `contents` / `posts` | General content/articles. |
| `facolta` | `faculties` | Academic faculties. |
| `goliardi` | `users` / `members` | The core "Goliarda" profile. |
| `indirizzi` | `addresses` | User IP/Host tracking or physical? (Legacy: IP tracking) |
| `linkz` | `links` | External or internal links. |
| `loginz` | `accounts` / `credentials` | Authentication data. |
| `ordini` | `orders` | Goliardia Orders (territorial). |
| `gms` | `messages` | Goliardia Messaging System. |

## Column Mapping Examples

### `orders` -> `orders`
- `ID_ORD` -> `id`
- `Nome_veloce` -> `short_name`
- `Citt` -> `city`
- `id_utente_creatore` -> `creator_account_id`

### `goliardi` -> `members`
- `ID_GOL` -> `id`
- `Nome` -> `first_name`
- `Cognome` -> `last_name`
- `DataProcesso` -> `initiation_date` (Goliardia process)
- `Nomegoliardico` -> `nickname` / `goliardic_name`
- `foto` -> `avatar_url` (to GCS)

### `appuntamenti` -> `events`
- `ID_appuntamento` -> `id`
- `tipodiappuntamento` -> `event_type`
- `data_inizio` -> `starts_at`
- `data_fine` -> `ends_at`
- `citt` -> `city`
