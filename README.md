# Shell_Scripts
Optimize your workflow using these efficient scripts! This curated collection offers indispensable tools for automating routine DevOps and Cloud operations, enabling you to conserve significant time and resources.

1. `backup.sh`:
Summary: This script creates a compressed backup of a specified source directory and saves it in a specified target directory with a timestamp in the filename.

Explanation:
- The script defines variables for the target directory, source directory, and the current date/time in a specific format.
- It prints the values of these variables for verification.
- It creates a compressed tar archive (`.tar.gz`) of the source directory and saves it in the target directory with the filename `backup_<timestamp>.tar.gz`.
- Finally, it lists the backup file in the target directory using `ls` command.

2. `compress_decompress.sh`:
Summary: This script provides a menu-driven interface to compress or decompress files using the `tar` utility.

Explanation:
- The script defines two functions: `compress_file` and `decompress_file`.
- The `compress_file` function prompts the user to enter the path of the file to compress, checks if the file exists, and compresses it using `tar -czvf` command.
- The `decompress_file` function prompts the user to enter the path of the compressed file to decompress, checks if the file exists, and decompresses it using `tar -xzvf` command.
- The script displays a menu with options to compress a file, decompress a file, or exit the script.
- Based on the user's choice, the corresponding function is called.

3. `devops_tools.sh`:
Summary: This script provides a menu-driven interface to install and configure various DevOps tools such as Docker, Jenkins, Terraform, AWS CLI, Trivy, Kubernetes, Ansible, and Vagrant on an Ubuntu system.

Explanation:
- The script defines several functions, each responsible for installing and configuring a specific tool.
- The `install_update` function updates the APT package lists.
- The other functions (`install_docker`, `install_Jenkins`, `install_terraform`, `install_awscli`, `install_trivy`, `install_kubernetes`, `install_ansible`, `install_vagrant`) follow similar steps: add required repositories, install dependencies, and install the respective tool.
- The script displays a menu with options to install the desired tool or exit the script.
- Based on the user's choice, the corresponding installation function is called.

4. `disk_monitor.sh`:
Summary: This script monitors the available disk space on the root partition and sends an email notification if the available space falls below a specified threshold.

Explanation:
- The script defines a function `check_disk_space` that checks the available disk space percentage on the root partition using the `df` command.
- It compares the available disk space percentage with a predefined threshold (80% in this case).
- If the available disk space is below the threshold, it sends an email notification using the `mailx` command with the subject "Disk Space Alert" and the message indicating the available disk space percentage.
- If the available disk space is above the threshold, it prints a message indicating that the disk space is within acceptable limits.
- The script calls the `check_disk_space` function to perform the disk space check.

5. `error_log_analyzer.sh`:
Summary: This script analyzes an error log file, categorizes the errors based on their messages, and creates a new log file with the categorized errors.

Explanation:
- The script defines a function `analyze_and_categorize_errors` that prompts the user to enter the path to the error log file.
- It checks if the log file exists and creates a new file called `categorized_errors.log` to store the categorized errors.
- The script uses a combination of `grep`, `awk`, `sort`, `uniq`, and a `while` loop to extract the error messages from the log file, count their occurrences, and categorize them.
- For each unique error message, it appends the error count and the error message to the `categorized_errors.log` file, separated by a separator line.
- The script displays a menu with options to analyze and categorize errors or exit the script.
- Based on the user's choice, the `analyze_and_categorize_errors` function is called or the script exits.

6. `file_encrypt_decrypt.sh`:
Summary: This script provides a menu-driven interface to encrypt and decrypt files using AES-256-CBC encryption with OpenSSL.

Explanation:
- The script defines two functions: `encrypt_file` and `decrypt_file`.
- The `encrypt_file` function prompts the user to enter the path of the file to encrypt and the path for the encrypted output file. It then uses the `openssl` command with the `enc` option to encrypt the file using AES-256-CBC encryption and writes the encrypted output to the specified file.
- The `decrypt_file` function prompts the user to enter the path of the encrypted file and the path for the decrypted output file. It then uses the `openssl` command with the `enc -d` option to decrypt the file using AES-256-CBC encryption and writes the decrypted output to the specified file.
- The script displays a menu with options to encrypt a file, decrypt a file, or exit the script.
- Based on the user's choice, the corresponding function is called.

7. `network_connectivity.sh`:
Summary: This script checks the network connectivity to a specified host using the `ping` command.

Explanation:
- The script defines a function `check_connectivity` that prompts the user to enter the host to ping.
- It uses the `ping` command with the `-c` option to send 3 packets to the specified host and captures the result.
- If the `ping` command is successful (returns 0), it prints a message indicating that the network connectivity to the host is OK.
- If the `ping` command fails (returns non-zero), it prints a message indicating that the network connectivity to the host is not reachable.
- The script calls the `check_connectivity` function to perform the network connectivity check.

8. `random_password_generator.sh`:
Summary: This script generates a random password with a specified length or a default length of 12 characters.

Explanation:
- The script defines a function `generate_password` that takes an optional argument for the desired password length.
- It defines a character set (`charset`) containing uppercase letters, lowercase letters, digits, and special characters.
- If the password length is not provided as an argument, it defaults to 12 characters.
- The script uses the `tr` command with the `-dc` option to remove non-charset characters from `/dev/urandom` (a source of random data) and `head` to limit the output to the desired password length.
- The generated password is stored in the `password` variable and printed to the console.
- The script prompts the user to enter the desired password length (or press Enter to use the default) and calls the `generate_password` function with the provided length.

9. `remote_backup.sh`:
Summary: This script creates a backup of a specified source directory, transfers the backup to a remote server using `rsync`, and stores it in a specified remote directory.

Explanation:
- The script defines a function `backup_and_transfer` that sets the required variables: `source_dir` (source directory to backup), `remote_user` (username for remote server access), `remote_host` (IP address or hostname of the remote server), and `remote_dir` (destination directory on the remote server).
- It generates a timestamp (`date`) and creates a backup directory (`backup_dir`) with the timestamp.
- The script uses `rsync` with the `-avz` and `--progress` options to create a backup of the `source_dir` in the `backup_dir`.
- It then uses `rsync` with the `-avz` and `--progress` options to transfer the `backup_dir` to the `remote_dir` on the remote server, using the specified `remote_user` and `remote_host`.
- The script prints a message indicating that the backup and transfer completed successfully.

10. `system_info.sh`:
Summary: This script gathers various system information and stores it in a text file named `system_info.txt`.

Explanation:
- The script defines a function `gather_system_info` that gets the current date and time using the `date` command.
- It creates a new text file `system_info.txt` or truncates an existing file with the same name.
- The script writes a header with the date and time to the file.
- It then uses various commands to gather system information and appends the output to the file:
  - `uname -a` for system overview
  - `hostname` for the hostname
  - `lscpu` for CPU information
  - `free -h` for memory information
  - `df -h` for disk information
  - `ip addr show` for network information
- The script prints a message indicating that the system information has been gathered successfully and stored in the `system_info.txt` file.

Certainly, here's the summary and explanation for the next 2 scripts:

11. `systesm_monitor.sh`:
Summary: This script monitors the CPU usage on the system and sends an email alert or displays a notification when the CPU usage exceeds a predefined threshold.

Explanation:
- The script defines a threshold value (`threshold`) for CPU usage as a percentage (80% in this example).
- It uses the `mpstat` command with the `1 1` arguments to get the current CPU usage and pipes the output to `awk` to extract the "CPU idle" percentage from the "Average:" line.
- The "CPU idle" percentage is subtracted from 100 to get the "CPU usage" percentage and stored in the `cpu_usage` variable.
- The script uses the `bc` command to compare the `cpu_usage` value with the `threshold` value.
- If the CPU usage exceeds the threshold, it sends an email notification using the `mailx` command with the subject "High CPU Usage Alert" and a message containing the current CPU usage percentage.
- Alternatively, you can uncomment the `echo` line to display a notification on the console instead of sending an email.

12. `user_add.sh`:
Summary: This script provides a menu-driven interface to manage user accounts on the system, including adding new users, deleting existing users, and listing all users.

Explanation:
- The script defines three functions: `add_user`, `delete_user`, and `list_users`.
- The `add_user` function prompts the user to enter a username, password, and full name. It checks if the user already exists using the `getent` command. If the user doesn't exist, it creates a new user account using `useradd` with the provided full name, sets the password using `chpasswd`, and confirms the successful creation.
- The `delete_user` function prompts the user to enter a username to delete. It checks if the user exists using the `id` command. If the user exists, it deletes the user account and their home directory using `userdel -r` and confirms the successful deletion.
- The `list_users` function displays a list of all users on the system by printing the first field (username) from the `/etc/passwd` file using `cut`.
- The script displays a menu with options to add a user, delete a user, list users, or exit the script.
- Based on the user's choice, the corresponding function is called.

These scripts demonstrate the use of shell scripting for system monitoring and user account management tasks. The `systesm_monitor.sh` script can be scheduled to run periodically using a cron job or a system monitoring tool to alert administrators about high CPU usage. The `user_add.sh` script provides a convenient way to manage user accounts from the command line.

These scripts cover a range of tasks, including file encryption/decryption, network connectivity checks, password generation, remote backup, and system information gathering. They demonstrate the use of shell scripting for various system administration and security-related tasks.

Overall, these scripts provide automation for various tasks such as creating backups, compressing/decompressing files, installing DevOps tools, monitoring disk space, and analyzing error logs. They demonstrate the use of shell scripting for system administration and DevOps tasks.
