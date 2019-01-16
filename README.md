# BBC Sound Effects ~ Recursive Download

Hello friends. I wrote this little bash script to save you the hassle of downloading individual samples from the BBC Sound Effects archive.

This script will loop over the entire database and download every file one after the other. If the script is cancelled for some reason, I've added in a check to see if the file(s) exist already. This will prevent the script from attempting to download a file you've already downloaded, so don't worry about stopping it if you need to.

## Requirements
This is a bash script so you'll need to run it inside a Unix shell/terminal:
- macOS/OSX/Linux users, this is the `Terminal` app.
- Windows 10 users, you can install a Linux shell reasonably easily: https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/
- Other Windows users, try googling `how to install bash on Windows *`.. hehe..