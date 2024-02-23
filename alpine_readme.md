


Run the script

To use the script on an Alpine Linux system, you'll need to follow these steps:

1. **Save the Script**: 
   - First, you'll need to save the script on your local machine. Open a text editor (like Notepad on Windows, TextEdit on Mac, or any code editor), and paste the script into it.
   - Save the file with a meaningful name and a `.sh` extension, for example, `alpine_setup.sh`. This extension is important as it indicates that the file is a shell script.

2. **Upload the Script to the Alpine Linux Server**:
   - You can use a file transfer method like SCP (Secure Copy Protocol) to upload the file. If you're using a Windows machine, you might need a tool like WinSCP. On Mac or Linux, you can use the terminal.
   - The SCP command format is: `scp /path/to/alpine_setup.sh username@remote_host:/path/where/to/save/`. Replace `/path/to/` with the actual path to your script, `username` with your Alpine Linux username, and `remote_host` with the server's address.
   - For example: `scp alpine_setup.sh user@192.168.1.100:/home/user/`

3. **Run the Script on the Alpine Linux Server**:
   - SSH into your Alpine Linux server using `ssh username@remote_host`.
   - Navigate to the directory where you uploaded the script using `cd /path/where/script/is/`. For example, `cd /home/user/`.
   - Before running the script, you need to make it executable. Use the command `chmod +x alpine_setup.sh`.
   - Now, you can run the script with `./alpine_setup.sh`.
   - You'll need to be either the root user or have sufficient permissions to execute these commands and the script itself.

A few important notes:
- Ensure that your Alpine Linux server has internet access, as the script needs to download and update packages.
- Always verify and test scripts in a controlled environment before deploying them on a production server to avoid any unintended consequences.
- The script will automatically reboot the server at the end, so be prepared for that.
- If you're new to using command-line interfaces or SSH, take extra care to ensure you understand each step before proceeding.

