# Initial Start
This repository is designed to simplify the process of reinstalling the operating system on my laptop.
With its help, I can quickly install all the necessary programs and scripts for work.
The repository contains the following scripts:

## Scripts
### start.sh
This script updates the system and installs the necessary programs and packages.

### sync_flashdrive.sh
This script synchronizes specific folders and files with a USB drive.
The script must be run from the drive.
This is a simple quick backup option.

### file_chng.py
This script tracks changes in files in the specified directory and provides information about added, modified, or deleted files.
I use this script to understand which files have changed to avoid accidentally corrupting data in the archive on the drive.

## Usage
### start.sh
Run this script to update the system and install all necessary programs and packages.
Use the following command:
```bash
./start.sh
```

### sync_flashdrive.sh
Run this script to synchronize your data with the USB drive.
Use the following command:
```bash
./sync_flashdrive.sh
```

### file_chng.py
Run this script to track changes in files in the current directory.
Use the following command:
```bash
python3 file_chng.py
```

These scripts will help you quickly set up the system and preserve your data when reinstalling the operating system.
