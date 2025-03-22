#!/bin/bash

# MySQL credentials and database name
MYSQL_USER="root"
MYSQL_PASSWORD="kali@123"
DATABASE_NAME="pharmacy_db"
BACKUP_DIR="/mnt/c/backups"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Generate a timestamp for unique backup filenames
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/pharmacy_backup_$TIMESTAMP.sql"

# Run mysqldump to create a backup
mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DATABASE_NAME" > "$BACKUP_FILE"

# Check if the backup command succeeded
if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
    exit 1
fi

