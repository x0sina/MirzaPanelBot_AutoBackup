# MirzaPanelBot_AutoBackup
A tool for Backup .sql database file of MarzbanPanelBot

# Installation guide

Run the following command

```bash
wget https://raw.githubusercontent.com/x0sina/MirzaPanelBot_AutoBackup/main/BackupMirzaPanel.sh | chmod +x backup_and_send.sh
```

Once the installation is complete

To run the script run the following command

```
./BackupMirzaPanel.sh
```

Open the crontab for editing using the following command:

```
crontab -e
```

Add the Cron Job Entry

Add the following line to the crontab file to schedule the script to run every 6 hours

```
0 */6 * * * ./BackupMirzaPanel.sh
```

Finish it will sends you the .sql file in your Telegram bot.
