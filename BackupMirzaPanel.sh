#!/bin/bash

# Function to prompt user and read input
prompt_user() {
  read -p "$1: " value
  echo "$value"
}

# Ask for Telegram Bot API Token
telegramBotToken=$(prompt_user "Enter your Telegram Bot API Token")

# Ask for Chat ID
chatID=$(prompt_user "Enter your Chat ID")

# Ask for Database User
databaseUser=$(prompt_user "Enter your Database User")

# Ask for Database Password
databasePassword=$(prompt_user "Enter your Database Password")

# Ask for Backup Filename (database name)
backupFilename=$(prompt_user "Enter the name for the backup file (without the '.sql' extension, e.g., db_mirzabot)")

# Backup directory
backupDir='/tmp/db_backup'

mkdir -p $backupDir

# Generate a unique filename for the backup
backupFilename="$backupFilename_$(date +'%Y-%m-%d_%H-%M-%S').sql"

# Command to create the database backup using mysqldump
mysqldump -u$databaseUser -p$databasePassword $databaseUser > $backupDir/$backupFilename

# Send the backup file to Telegram
telegramAPI="https://api.telegram.org/bot$telegramBotToken/sendDocument"
curl -F "chat_id=$chatID" -F "document=@$backupDir/$backupFilename" "$telegramAPI"

# Remove the local backup file after sending it to Telegram
rm "$backupDir/$backupFilename"
