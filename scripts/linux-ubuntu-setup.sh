#!/usr/bin/env bash

# If there is a .bashrc.local, add rbenv configuration to the end
local_profile="$HOME/.bashrc.local"

# add git repositories from the source
sudo add-apt-repository ppa:git-core/ppa

# do some basic setup
sudo apt-get update
sudo apt-get upgrade

# Get some important build stuff
sudo apt-get -y install build-essential clang libssl-dev python-dev cmake

# get me some critical applications
sudo apt-get -y install vim curl git terminator tmux ssh xclip wget

# Install KeyPass
sudo apt-get -y install keepass2 xdotool

# get Dropbox
if [ ! -d "$HOME/.dropbox-dist" ]; then
    prev_dir=`pwd`
    cd $HOME
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    $HOME/.dropbox-dist/dropboxd &
    cd $prev_dir
    read -p "Set up DropBox. Press enter when done..."
fi

# setup a key for ssh (Github, et al)
if [ ! -s "$HOME/.ssh/id_rsa.pub" ]; then
    read -p "Log into GitHub before moving on. Press enter when done..."
    ssh-keygen -t rsa -C "me@jamesleonis.com" -f "$HOME/.ssh/id_rsa"
    xclip -sel clip < "$HOME/.ssh/id_rsa.pub"
    read -p "Copy into GitHub. Press enter when done..."
fi

# install rbenv for ruby
if [ ! -d "$HOME/.rbenv" ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

    if [ ! -e $local_profile ]; then
        touch $local_profile
    fi

    # If rbenv environment variables aren't set, do so now
    grep ".rbenv/bin" "$local_profile" >> /dev/null
    if [ $? -eq 1 ]; then
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $local_profile
        echo 'eval "$(rbenv init -)"' >> $local_profile
    fi

    # Get the ruby-build plugin so we can install rubies
    git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build

    # Patch rbenv into our current shell
    source $local_profile

    # install a version of ruby
    rbenv install 2.1.2
    rbenv rehash

    # set ruby version
    rbenv global 2.1.2
fi

# get my dotfiles
dotfile_dir="$HOME/.dotfiles"
if [ ! -d "$dotfile_dir" ]; then
    # Make sure the rbenv variables are set
    source $local_profile

    prev_dir=`pwd`
    git clone git@github.com:jamesleonis/dotfiles.git $dotfile_dir
    cd $dotfile_dir
    ./scripts/install
    cd $prev_dir
fi

# get BitTorrent Sync
if [ ! -d "$HOME/.btsync" ]; then
    #download and install
    prev_dir=`pwd`
    mkdir $HOME/.btsync
    cd $HOME/.btsync
    wget -O - "http://download-lb.utorrent.com/endpoint/btsync/os/linux-glibc23-x64/track/stable" | tar xzf -
    mkdir -p $HOME/sync/keys
    $HOME/.btsync/btsync &
    cd $prev_dir
fi

# install other interesting programs
sudo apt-get -y install chromium-browser vlc

# Cleanup
unset dotfile_dir local_profile prev_dir
