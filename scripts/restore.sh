#!/usr/bin/env bash

set -euo pipefail

DB_CONTAINER="devops-assessment-postgres"

DB_USER="appuser"

RESTORE_DB="hotel_booking_restore"

BACKUP_FILE="${1:-}"

if [[ -z "$BACKUP_FILE" ]]; then
    echo "Usage:"
    echo "./scripts/restore.sh <backup-file>"
    exit 1
fi

if [[ ! -f "$BACKUP_FILE" ]]; then
    echo "Backup file not found:"
    echo "$BACKUP_FILE"
    exit 1
fi

echo "Creating fresh restore database..."

docker exec "$DB_CONTAINER" \
  psql \
  -U "$DB_USER" \
  -d postgres \
  -c "DROP DATABASE IF EXISTS ${RESTORE_DB};"

docker exec "$DB_CONTAINER" \
  psql \
  -U "$DB_USER" \
  -d postgres \
  -c "CREATE DATABASE ${RESTORE_DB};"

echo "Restoring backup..."

cat "$BACKUP_FILE" | docker exec -i "$DB_CONTAINER" \
  psql \
  -U "$DB_USER" \
  -d "$RESTORE_DB"

echo "Restore completed successfully."
