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
   sudo ln -s /path/to/reminder/program/reminder /usr/bin/reminder
```

## Next steps

- Implement notification system using libnotify-bin

## For RVM users

The ruby interpreter may not be available where the shebang requires (/usr/bin/), but you 
can do it with a simple soft link.
```bash
   sudo ln -s /home/your_user/.rvm/rubies/your_ruby_version/bin/ruby /usr/bin/ruby
```


## Disclaimer
- At this point, reminder is not compatible with Windows, but is an very good idea for the future.
- Windows users may alter some files to use reminder correctly.
