#!/bin/bash

# Telegram Bot API Token
telegramBotToken=''

# Chat ID where the backup will be sent
chatID=''

# Database credentials
databaseUser=''
databasePassword='' # Replace with the actual password for 'database' user
databaseName=''

# Backup directory
backupDir='/tmp/db_backup'

mkdir -p $backupDir

# Generate a unique filename for the backup
backupFilename="db_mirzabot_$(date +'%Y-%m-%d_%H-%M-%S').sql"

# Command to create the database backup using mysqldump
mysqldump -u$databaseUser -p$databasePassword $databaseName > $backupDir/$backupFilename

# Send the backup file to Telegram
telegramAPI="https://api.telegram.org/bot$telegramBotToken/sendDocument"
curl -F "chat_id=$chatID" -F "document=@$backupDir/$backupFilename" "$telegramAPI"

# Remove the local backup file after sending it to Telegram
rm "$backupDir/$backupFilename"
