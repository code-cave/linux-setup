#!/usr/bin/env sh

# This script sets up all the cool vim stuffs
# like packages, directories, files, and paths
set -eu

# Setup the vim path variables
src_dir="$(dirname $(realpath $0))"
dot_vim_dir=${src_dir}/.vim
autoload_dir=${dot_vim_dir}/autoload
bundle_dir=${dot_vim_dir}/bundle
colors_dir=${dot_vim_dir}/colors

printf "Starting vim setup ...\n"
printf "Source vim directory: ${src_dir}\n"
sleep 3

mkdir ${autoload_dir} ${bundle_dir} ${colors_dir}
mkdir ${dot_vim_dir}/backup ${dot_vim_dir}/swap

printf "Downloading vim pathogen ...\n"
curl -Lo ${autoload_dir}/pathogen.vim https://tpo.pe/pathogen.vim

# List of vim bundles
bundles="\
  https://github.com/vim-airline/vim-airline.git \
  https://github.com/altercation/vim-colors-solarized.git \
  https://github.com/tpope/vim-vinegar.git"

# Clone each bundle
printf "Cloning vim bundles ...\n"
sleep 3
for bundle in ${bundles}
do
  bundle_name=${bundle##*/}
  bundle_name=${bundle_name%.git}
  git clone --recurse-submodules ${bundle} ${bundle_dir}/${bundle_name}
done

# Create .vim directory with content
[ -d ${HOME}/.vim ] && mv ${HOME}/.vim ${HOME}/.vim_old
[ -f ${HOME}/.vimrc ] && mv ${HOME}/.vimrc ${HOME}/.vimrc_old
[ -L ${HOME}/.vimrc ] && rm ${HOME}/.vimrc

cp -r ${dot_vim_dir} ${HOME}/
ln -s ${HOME}/.vim/.vimrc ${HOME}/.vimrc

rm -rf ${dot_vim_dir}

printf "\nSetup complete for vim: ~/.vim ~/.vimrc\n\n"
sleep 3

exit 0

