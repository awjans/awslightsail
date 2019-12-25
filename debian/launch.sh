#!/bin/bash
# Boot Strap some Common Tasks, Clone a GIT Repository and execute the
# Configuration Script in the GIT Repository to finish setting up the machine.

# Set the necessary environment variables
export GITUSER="myusername"
export GITREPO="myrepository"

# Update Debian Repositories, Upgrade installed packages and Install Git
apt -y update && apt -y upgrade && apt -y install git

# Make the Source Directory
mkdir /src && cd /src

# Clone the Git Repository
git clone https://github.com/${GITUSER}/${GITREPO}.git

# If the Debian Configurtion Script exists
if test -f "/src/${GITREPO}/debian/configure.sh"; then
# Make the Configuration Script executable
chmod ug+x /src/${GITREPO}/debian/configure.sh
# Execute the Configuration Script
/src/${GITREPO}/debian/configure.sh
fi
