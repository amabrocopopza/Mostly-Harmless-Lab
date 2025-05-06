#!/bin/bash
set -e

# Required ENV variables
: "${POSTGRES_ADMIN_USER:?Need to set POSTGRES_ADMIN_USER}"
: "${POSTGRES_ADMIN_PASSWORD:?Need to set POSTGRES_ADMIN_PASSWORD}"
: "${POSTGRES_HOST:?Need to set POSTGRES_HOST}"
: "${POSTGRES_PORT:=5432}"
: "${POSTGRES_USER:?Need to set POSTGRES_USER}"
: "${POSTGRES_PASSWORD:?Need to set POSTGRES_PASSWORD}"
: "${POSTGRES_DB:?Need to set POSTGRES_DB}"

export PGPASSWORD="$POSTGRES_ADMIN_PASSWORD"

# Create user if not exists
psql -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_ADMIN_USER" -d postgres -tc "SELECT 1 FROM pg_roles WHERE rolname='$POSTGRES_USER'" | grep -q 1 || \
  psql -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_ADMIN_USER" -d postgres -c "CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"

# Create database if not exists and set owner
psql -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_ADMIN_USER" -d postgres -tc "SELECT 1 FROM pg_database WHERE datname='$POSTGRES_DB'" | grep -q 1 || \
  psql -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_ADMIN_USER" -d postgres -c "CREATE DATABASE $POSTGRES_DB OWNER $POSTGRES_USER;"

# Ensure ownership (in case DB was created before)
psql -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_ADMIN_USER" -d postgres -c "ALTER DATABASE $POSTGRES_DB OWNER TO $POSTGRES_USER;"
