# Reminder CLI

A simple Ruby-based Command Line Interface (CLI) program to manage reminders. This tool allows you to add, list, and delete reminders from your system using different commands.

## Features

- **Add a Reminder**: Add a reminder with a description and a timestamp.
- **List All Reminders**: View all your reminders.
- **Delete a Specific Reminder**: Delete a reminder by its ID.
- **Delete All Reminders**: Delete all reminders with a confirmation prompt.
- **Help**: Display help information about the available commands.

## Requirements

- Ruby version 3.0 or higher.
- SQLite3 package

## Disclaimer
- Windows users may alter the shebang and turn into the script in .exe to allow execute the script

## Installation

1. Clone the repository to your local machine:
```bash
   git clone https://github.com/sami-daniel/reminder.git
   cd reminder
```

2. Install all the dependencies with bundle install
```bash
   bundle install
```

3. Use it
```bash
   ./reminder --add "Go to grocery store" 19:00
```

## Tips

You can make a soft link to reminder binary to use it from everywhere on your terminal

```bash
   sudo ln -s ./reminder /usr/bin/reminder
```

## Next steps

- Implement notification system using libnotify-bin