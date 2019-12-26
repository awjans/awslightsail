#!/bin/bash
# Boot Strap some Common Tasks, Clone a GIT Repository and execute the
# Configuration Script in the GIT Repository to finish setting up the machine.

# Set the necessary environment variables
export GITUSER="myusername"
export GITREPO="myrepository"

# Update Debian Repositories, Upgrade installed packages and Install Git
apt -y update >> /var/log/launch.log 2>> /var/log/launch.error.log
apt -y upgrade >> /var/log/launch.log 2>> /var/log/launch.error.log
apt -y install git >> /var/log/launch.log 2>> /var/log/launch.error.log

# Make the Source Directory
mkdir /src >> /var/log/launch.log 2>> /var/log/launch.error.log
cd /src >> /var/log/launch.log 2>> /var/log/launch.error.log

# Clone the Git Repository
git clone https://github.com/${GITUSER}/${GITREPO}.git >> /var/log/launch.log 2>> /var/log/launch.error.log

# If the Debian Configurtion Script exists
if test -f "/src/${GITREPO}/debian/configure.sh"; then
# Make the Configuration Script executable
chmod ug+x /src/${GITREPO}/debian/configure.sh >> /var/log/launch.log 2>> /var/log/launch.error.log
# Execute the Configuration Script
/src/${GITREPO}/debian/configure.sh >> /var/log/launch.log 2>> /var/log/launch.error.log
fi
