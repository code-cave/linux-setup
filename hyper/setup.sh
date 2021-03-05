#!/usr/bin/env sh

# This script sets up the Hyper terminal config
set -eu

# Set linux-setup/hyper path
src_dir="$(dirname $(realpath $0))"

printf "Starting hyper terminal setup ...\n"
printf "Source hyper directory: ${src_dir}\n\n"
sleep 3

[ -f ${HOME}/.hyper.js ] && mv ${HOME}/.hyper.js ${HOME}/.hyper_old.js

cp ${src_dir}/.hyper.js ${HOME}/

printf "Setup complete for hyper terminal: ~/.hyper.js\n\n"
sleep 3

exit 0

