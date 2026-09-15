#!/usr/bin/env bash

set -euo pipefail

DB_CONTAINER="devops-assessment-postgres"
DB_USER="appuser"

echo "Checking source database..."

BOOKINGS=$(docker exec "$DB_CONTAINER" \
  psql -U "$DB_USER" -d hotel_booking -tAc \
  "SELECT COUNT(*) FROM hotel_bookings;")

EVENTS=$(docker exec "$DB_CONTAINER" \
  psql -U "$DB_USER" -d hotel_booking -tAc \
  "SELECT COUNT(*) FROM booking_events;")

echo "Source bookings: $BOOKINGS"
echo "Source events:   $EVENTS"

if [[ "$BOOKINGS" -lt 100 ]]; then
    echo "ERROR: Less than 100 bookings."
    exit 1
fi

if [[ "$EVENTS" -lt 1 ]]; then
    echo "ERROR: No booking events found."
    exit 1
fi

echo "Checking restore database..."

RESTORED_BOOKINGS=$(docker exec "$DB_CONTAINER" \
  psql -U "$DB_USER" -d hotel_booking_restore -tAc \
  "SELECT COUNT(*) FROM hotel_bookings;")

echo "Restored bookings: $RESTORED_BOOKINGS"

if [[ "$BOOKINGS" != "$RESTORED_BOOKINGS" ]]; then
    echo "ERROR: Source and restored booking counts differ."
    exit 1
fi

echo "=================================="
echo "Verification successful."
echo "=================================="
