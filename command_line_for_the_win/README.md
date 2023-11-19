# Command line for the win

## How the images were uploaded through cmd using SFTP
- sftp username@remote host name, was used to establish a connection to the sandbox
- the username and remote hostname were gotten from the alx intranet.
- used the 'pwd' and 'ls' commands to get a sense of my current location in the remote hosts file system.
- then the command 'cd /root/alx-system_engineering-devops/' to navigate to the directory that will hold the project's directory (note: I have the repo 'alx-system_engineering-devops/' cloned on my remote host before now).
- 'mkdir command_line_for_the_win' was was used to create the directory that will hold the project files.
- 'cd command_line_for_the_win' was used to change working directory to the newly created directory.
- The commands 'lpwd' and 'lls' were used to get a sense of my current location in my local system.
- then I used the 'lcd' command to navigate to where the files to be transfered are located.
- then I used the commands 'put 0-first_9_tasks.jpg' put 1-next_9_tasks' 'put 2-next_9_tasks.jpg' to transfer the files from my local system to the remote system.
- Then I used the 'exit' command to close the connect.
- Logged into my sandbox using ssh, navigate to the directory create this readme file and push everything to the repo using 'git add, git commit and git push'
