#!/usr/bin/env sh

# This script sets up the system umask
set -eu

# Set linux-setup/umask path
src_dir="$(dirname $(realpath $0))"

printf "Starting umask setup ...\n"
printf "Source umask directory: ${src_dir}\n"
sleep 3

[ -f /etc/profile.d/umask.sh ] && sudo rm /etc/profile.d/umask.sh

sudo cp ${src_dir}/umask.sh /etc/profile.d/
sudo chmod 644 /etc/profile.d/umask.sh

printf "\nSetup complete for umask: /etc/profile.d/umask.sh\n\n"
sleep 3

exit 0

