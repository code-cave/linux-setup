#!/usr/bin/env sh
#
# Set some vars
dir=$( pwd )
downloads_dir=~/Downloads
repositories_dir=~/Repositories
tools_dir=${repositories_dir}/tools
desktop=false
vim_configure="--prefix=/usr --enable-fail-if-missing --with-features=normal --enable-cscope \
               --with-tlib=ncurses --enable-pythoninterp=yes --with-python-command=/usr/bin/python"

# Make some dirs
mkdir -p ${downloads_dir}
mkdir -p ${tools_dir}
mkdir -p ${code_cave_dir}

# Initial yum commands
sudo yum update -y
# Assuming a minimal install
sudo yum group install -y Server
sudo yum install -y epel-release curl-devel openssl-devel ncurses-devel 
sudo yum install -y ruby-devel perl-devel python2 python36
sudo yum install -y zlib-devel # For installing Git


# For desktop
if [ "${1}" = "desktop" ]; then
  desktop=true
  vim_configure="${vim_configure} --with-x=yes"
  sudo yum install -y gcc xorg-x11-server-devel libX11-devel libXt-devel
fi


# Git
sudo yum install -y git
cd ${tools_dir}
git clone https://github.com/git/git.git
cd ${tools_dir}/git
sudo yum remove -y git
make configure
./configure --prefix=/usr
make
sudo make install
cp -r ${code_cave_dir}/git/* ~/
cd


# Install desktop apps
if ${desktop}; then
  # Vim
  cd ${tools_dir}
  git clone https://github.com/vim/vim.git
  ./configure ${vim_configure}
  make
  sudo make install
  cd
  rm .vimrc
  cp -r ${code_cave_dir}/vim ~/
  ln -s .vimrc ~/.vim/.vimrc
  cd ${dir}

  # Hyper
  sudo yum install -y libappindicator libicns-utils xz
  curl -L https://releases.hyper.is/download/rpm>~/Downloads/hyper.rpm
  sudo rpm -i ~/Downloads/hyper.rpm
  rm ~/Downloads/hyper.rpm
  cp ${code_cave_dir}/hyper/* ~/
fi
