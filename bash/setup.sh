#!/usr/bin/env sh

# This script sets up the .bash_profile and sources
set -eu

# Set linux-setup/bash path
src_dir="$(dirname $(realpath $0))"
dot_dir=${src_dir}/.bash

printf "Starting bash setup ...\n"
printf "Source bash directory: ${src_dir}\n\n"
sleep 3

[ -d ${HOME}/.bash ] && mv ${HOME}/.bash ${HOME}/.bash_old
[ -f ${HOME}/.bash_profile ] && mv ${HOME}/.bash_profile ${HOME}/.bash_profile_old

cp -r ${dot_dir} ${HOME}/
cp ${src_dir}/.bash_profile ${HOME}/

printf "Setup complete for bash: ~/.bash ~/.bash_profile\n"
printf "Source the ~/.bash_profile to refresh the terminal\n\n"
sleep 3

exit 0

