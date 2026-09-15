#!/usr/bin/env bash

set -euo pipefail

DB_CONTAINER="devops-assessment-postgres"
DB_NAME="hotel_booking"
DB_USER="appuser"

BACKUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/backups"

TIMESTAMP="$(date +"%Y%m%d_%H%M%S")"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="${BACKUP_DIR}/hotel_booking_${TIMESTAMP}.sql"

echo "Starting database backup..."

docker exec "$DB_CONTAINER" \
  pg_dump \
  -U "$DB_USER" \
  -d "$DB_NAME" \
  > "$BACKUP_FILE"

echo "Backup completed:"
echo "$BACKUP_FILE"
