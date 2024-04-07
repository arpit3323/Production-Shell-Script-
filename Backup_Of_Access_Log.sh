#!/bin/bash

# Set the directory where the access log file is located
LOG_DIR="/path/to/log/directory"


# Set the name of the access log file
LOG_FILE="access.log"

# Set the directory where backups will be stored
BACKUP_DIR="/path/to/backup/directory"

# Set the directory where the file is located
FILE_DIR="/path/to/file/directory"

# Set the name of the file
FILE_NAME="data.txt"

# Set the directory where archives will be stored
ARCHIVE_DIR="/path/to/archive/directory"

# Backup and truncate log file
backup_log() {
    # Create a timestamp for the backup file name
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")

    # Define the backup file name with timestamp
    BACKUP_FILE="$BACKUP_DIR/$LOG_FILE.$TIMESTAMP"

    # Copy the log file to the backup directory
    cp "$LOG_DIR/$LOG_FILE" "$BACKUP_FILE"

    # Truncate the log file
    truncate -s 0 "$LOG_DIR/$LOG_FILE"
}

# Clear old log files

clear_old_logs() {
    # Remove log files older than 30 days
    find "$LOG_DIR" -name "$LOG_FILE*" -type f -mtime +30 -exec rm {} \;
}

# Archive file every fortnight
#
archive_file() {
    # Create a timestamp for the archive file name
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    # Define the archive file name with timestamp
    ARCHIVE_FILE="$ARCHIVE_DIR/$FILE_NAME.$TIMESTAMP.tar.gz"

    # Archive the file
    tar -czf "$ARCHIVE_FILE" -C "$FILE_DIR" "$FILE_NAME"
    # Remove the original file
    rm "$FILE_DIR/$FILE_NAME"
}

# Execute backup and truncate log file
backup_log

# Execute clearing old log files
clear_old_logs

# Execute archiving file
archive_file


