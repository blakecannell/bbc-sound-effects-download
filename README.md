# BBC Sound Effects ~ Recursive Download

Hello friends. I wrote this little bash script to save you the hassle of downloading individual samples from the BBC Sound Effects archive.

This script will loop over the entire database and download every file one after the other. If the script is cancelled for some reason, I've added in a check to see if the file(s) exist already. This will prevent the script from attempting to download a file you've already downloaded, so don't worry about stopping it if you need to.

## Requirements
This is a bash script so you'll need to run it inside a Unix shell/terminal:
- macOS/OSX/Linux users, this is the `Terminal` app.
- Windows 10 users, you can install a Linux shell reasonably easily: https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/
- Other Windows users, try googling `how to install bash on Windows *`.. hehe..

## How To
1. Download the package:
  - Above the top right of this readme is a green button `Clone or download`.
  - Choose the `Download Zip` option.
2. Unzip the package to your desktop (or wherever you wish, remembering where you put it when I later reference your desktop), this should create a `bbc-sound-effects-download-master` folder with the contents of the package.
3. Open the `Terminal` app.
4. Change directory to the package:
  - *macOS*: `cd ~/Desktop/bbc-sound-effects-download-master`
  - *Windows 10*: I'm not sure about the folder structure of where the Linux shell is installed so.. Hit me up and I'll work through this part with you
5. Run the following: `sudo sh ./download.sh`
  - *This will ask your for your password, this is the login to your macOS account. If you're on the Windows 10 Linux shell you would have created an account when you installed the shell, use that.*

This should begin the download(s) in a newly created `BBC_Sound_Effects` folder. This might take a while.. Don't watch, it slows down your internet connection. 😏

Let me know if you have any problems and I'll guide you through it. I haven't let this do a full run through yet so if the script fails please let me know.

### Misc
If you're curious as to how this works checkout the `download.sh` file above, I commented it pretty well so you can follow along.

Why Bash? Because most people are capable of running it without installing other language compilers/interpreters. Yes it was painful and I'd have much rather written this in ruby.

Enjoy x

