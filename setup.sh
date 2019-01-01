#!/bin/bash

# update system
sudo apt update
sudo apt -y upgrade

# install apps
sudo apt install -y vim git ranger tree cmake gcc g++ make htop zsh autojump clang

# opencv
# sudo apt install libopencv-dev
# gdal
# sudo apt install gdal-bin libgdal-dev

# ssh server; see details in ubuntu_setup_env.sh
# when using clion or pycharm on windows
# you can use ssh (port 2222) to connect wsl 
# and then compile target files on wsl
wget https://raw.githubusercontent.com/JetBrains/clion-wsl/master/ubuntu_setup_env.sh && bash ubuntu_setup_env.sh

# Anaconda, python 3.6
wget -c https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh
chmod a+x Anaconda3-5.2.0-Linux-x86_64.sh
./Anaconda3-5.2.0-Linux-x86_64.sh

# install pytorch

# install tensorflow with ---

# oh-my-zsh
rm -rf $HOME/.oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# remove and link config files
rm -rf $HOME/.vimrc
rm -rf $HOME/.zshrc

ln -sfn $HOME/my-wsl/.vimrc $HOME/.vimrc
ln -sfn $HOME/my-wsl/.zshrc $HOME/.zshrc
ln -sfn $HOME/my-wsl/.profile $HOME/.profile

# vim
rm -rf $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


