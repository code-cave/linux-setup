#!/usr/bin/env sh

# This script puts the .git files where they belong
set -eu

# Set linux-setup/git path
src_dir="$(dirname $(realpath $0))"
dot_git_dir=${src_dir}/.git

printf "Starting git setup ...\n"
printf "Source git directory: ${src_dir}\n\n"
sleep 3

printf "Downloading git-completion.bash ...\n"
file_url=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -Lo ${dot_git_dir}/git-completion.bash ${file_url}

# Remove files if they already exist
[ -d ${HOME}/.git ] && mv ${HOME}/.git ${HOME}/.git_old
[ -f ${HOME}/.gitconfig ] && mv ${HOME}/.gitconfig ${HOME}/.gitconfig_old

cp -r ${dot_git_dir} ${HOME}/
cp ${src_dir}/.gitconfig ${HOME}/
rm ${dot_git_dir}/git-completion.bash

printf "\nSetup complete for git: ~/.git ~/.gitconfig\n\n"
sleep 3

exit 0

