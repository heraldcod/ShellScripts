# ShellScripts
Shell scripts that automate Linux system administration tasks

Script 1 ( addusers.sh )
Goal:- Create a shell script that adds users to the same Linux system as the script is executed on.

1. Enforces that it be executed with superuser (root) privileges.  If the script is not executed with superuser privileges it will not attempt to create a user and        returns an exit status of 1.

2. Prompts the person who executed the script to enter the username (login), the name for person who will be using the account, and the initial password for the account.

3. Creates a new user on the local system with the input provided by the user.

4. Informs the user if the account was not able to be created for some reason.  If the account is not created, the script is to return an exit status of 1.

5. Displays the username, password, and host where the account was created.  This way the help desk staff can copy the output of the script in order to easily deliver the information to the new account holder.
