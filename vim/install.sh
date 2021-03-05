#!/usr/bin/env sh

# This script compiles vim from source and installs it
set -eu

# Set linux-setup/vim path
src_dir="$(dirname $(realpath $0))"
toolbox_dir=${1:-${HOME}/Repositories/toolbox}
source_code=${toolbox_dir}/vim

printf "Starting vim install ...\n"
printf "Source vim directory: ${src_dir}\n"
printf "Source code directory: ${source_code}\n\n"
sleep 3

printf "Installing required packages:\n\
  build-essential\n\
  clang\n\
  gcc\n\
  libncurses5-dev\n\
  libncursesw5-dev\n\
  libxt-dev\n\
  perl\n\
  python\n\
  python-dev\n\
  python3\n\
  ruby\n\
  ruby-dev\n\
  xorg-dev\n\n"
sleep 3

sudo apt-get install -y build-essential clang gcc libncurses5-dev \
  libncursesw5-dev libpython3-dev libxt-dev perl ruby ruby-dev xorg-dev

# Set the vim configuration options
vim_configure="\
  --prefix=/usr/local \
  --with-x=yes \
  --with-features=normal \
  --enable-gui=no \
  --enable-fail-if-missing \
  --enable-rubyinterp=yes \
  --enable-python3interp=yes \
  --with-python3-command=/usr/bin/python3"
#  --enable-pythoninterp=yes \
#  --with-python-command=/usr/bin/python \

# Clone the vim repository if needed
if [ ! -d ${source_code} ]
then
  mkdir -p ${toolbox_dir}
  git clone https://github.com/vim/vim.git ${source_code}
fi

# Go to the vim directory and pull
orig_dir="$(pwd)"
cd ${source_code}
printf "\nPulling vim repository for updates ${source_code} ...\n"
sleep 3
git pull

# Do the configuration and install
printf "\nStarting vim configuration and installation ...\n"
sleep 3
sudo make distclean
./configure ${vim_configure}
sudo make install

# Remove crud and go back to the original directory
sudo make distclean
cd ${orig_dir}

printf "\nInstallation complete for vim: $(which vim)\n\n"
sleep 3

exit 0

