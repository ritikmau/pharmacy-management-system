#!/bin/bash

# MySQL credentials and database name
MYSQL_USER="root"
MYSQL_PASSWORD="kali@123"
DATABASE_NAME="pharmacy_db"
BACKUP_DIR="/mnt/c/backups"

# Automatically find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/pharmacy_backup_*.sql 2>/dev/null | head -n 1)

# Ensure a backup file exists
if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ Error: No backup file found in $BACKUP_DIR."
    exit 1
fi

echo "♻️ Restoring database from: $LATEST_BACKUP"

# Drop and recreate the database (simulate disaster recovery)
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "DROP DATABASE IF EXISTS $DATABASE_NAME; CREATE DATABASE $DATABASE_NAME;"

# Restore the backup into the database
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DATABASE_NAME" < "$LATEST_BACKUP"

if [ $? -eq 0 ]; then
    echo "✅ Database restoration successful!"
else
    echo "❌ Database restoration failed!"
    exit 1
fi

