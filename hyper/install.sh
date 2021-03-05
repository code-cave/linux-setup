#!/usr/bin/env sh

# This script installs the Hyper terminal
set -eu

# Set linux-setup/hyper path
src_dir="$(dirname $(realpath $0))"

printf "Starting hyper terminal install ...\n"
printf "source hyper directory: ${src_dir}\n\n"
sleep 3

printf "Downloading hyper terminal deb package ...\n"
curl -Lo ${src_dir}/hyper.deb https://releases.hyper.is/download/deb

printf "\nInstalling hyper terminal deb package ...\n"
sleep 3
sudo apt-get install -y ${src_dir}/hyper.deb
rm ${src_dir}/hyper.deb

printf "\nInstall complete for hyper terminal: $(which hyper)\n\n"
sleep 3

exit 0

