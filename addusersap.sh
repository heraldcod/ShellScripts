#!/bin/bash
#
# This script creates a new user on the local system
# The username, password, and host for the account will be displayed

# Make sure the script is being excecuted with superuser privileges

if [[ "${UID}" -ne 0 ]]
then
echo 'Please run with sudo or as a root user.'
exit 1
fi

# If they don't supply atleast one argument, then give them help

if [[ "${#}" -lt 1 ]]
then
echo
echo "To create an account on the local system with the name of USER_NAME and a comments field of COMMENT

Run script like : ${0} USER_NAME COMMENT(Optional)"
echo
exit 1
fi

# The first parameter is the username
USER_NAME="${1}"

# The rest of the parameters are for the account comments.
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create the account
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.

if [[ "${?}" -ne 0 ]]
then
echo 'The account could not be created.'
exit 1
fi

# Set password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.

if [[ "${?}" -ne 0 ]]
then
echo 'The password for the account could not be set.'
exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created
echo " Username: ${USER_NAME}
Password: ${PASSWORD}
Host: ${HOSTNAME} "
exit 0