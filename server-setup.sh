#!/bin/bash
#
# Copyright (C) 2021 Arjun Ingole
#

bash_dir=$(pwd)
cd $HOME

echo "Beginning To Setup"
sudo apt update
sudo apt full-upgrade -y

echo "Installing Required Packages"
sudo apt install -y adb autoconf automake axel bc bison build-essential \
                    ccache clang cmake expat fastboot flex g++ \
                    g++-multilib gawk gcc gcc-multilib git gnupg gperf \
                    htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev \
                    libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev \
                    libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop \
                    maven ncftp ncurses-dev patch patchelf pkg-config pngcrush \
                    pngquant python2.7 python-all-dev re2c schedtool squashfs-tools subversion \
                    texinfo unzip w3m xsltproc zip zlib1g-dev lzip \
                    libxml-simple-perl apt-utils gh \

echo "Installed Required Packages "

# Set Up git

echo "Setting Up Git"
git config --global user.email "arjun@project404.us"
git config --global user.name "Arjun-Ingole"
git config --global alias.cp 'cherry-pick'
git config --global alias.c 'commit'
git config --global alias.f 'fetch'
git config --global alias.rb 'rebase'
git config --global alias.rs 'reset'
git config --global alias.ck 'checkout'
echo "Done"

# Setup Transfer
echo "Setting up Transfer"
curl -sL https://git.io/file-transfer | sh
sudo install transfer /usr/local/bin/transfer
echo "Done"

# Ccache
ccache -M 100G
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

# Timezone
export TZ='Asia/Kolkata'

# Generate ssh key for Github
if [[ $1 = "-s" || $1 = "--sgh" ]]; then
git config --global url."git@github.com:".insteadOf "https://github.com/"
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub

echo"^^^^^^^ Please Put the Generated key in Github"
echo" Make sure to Run ssh -T git@github.com "
fi

# Oh My ZSH
echo "Setting Up OH MY ZSH !!!!!"
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
echo "Done"

# Done
echo "We are Ready to Roll"
cd $bash_dir
