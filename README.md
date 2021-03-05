# Linux Setup
![Red Hat and CentOS Logos](./images/red-hat-centos-logos.png)

## Description
The purpose of this repository is to make life easy when setting up a new RHEL/CentOS 8 Linux machine.  
The setup script installs a bunch of handy tools that are necessary for a RHEL/CentOS 8 server.  
The setup script **doesn't install a bunch of useless crap**, it really just installs the  
normal server tools and some other ***nice to have*** things

## Desktop Option
There is an option to install the Cinnamon desktop along with some other desktop essentials  
like Vim with GUI options, Hyper terminal, NVIDIA graphics drivers, etc.

## Initial Clone Script
Because Git might not come with all CentOS installations, the below script will need to be  
executed first so that this project gets cloned into the filesystem and becomes usable.  
Assuming you have a minimal CentOS installation, you will probably have to type out all  
the commands because you'd probably be viewing this page from a different machine.
```sh
sudo yum install -y git curl-devel openssl-devel
# The installation directories below can be changed if desired
mkdir -p ~/Repositories/codecave; cd ~/Repositories/codecave
git clone https://github.com/codecave/linux-setup.git
cd linux-setup
```

