#!/usr/bin/env bash

# add git repositories from the source
sudo add-apt-repository ppa:git-core/ppa

# do some basic setup
sudo apt-get update
sudo apt-get upgrade

# get me some critical applications
sudo apt-get -y install vim curl git terminator tmux ssh xclip wget

# install rbenv for ruby
if [ ! -d "$HOME/.rbenv" ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

    # If there is a .bashrc.local, add rbenv configuration to the end
    profile="$HOME/.bashrc.local"
    if [ -s $profile ]; then
        if grep -Fxq ".rbenv/bin" "$profile"; then
            echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $profile
            echo 'eval "$(rbenv init -)"' >> $profile
        fi
    fi

    # Get the ruby-build plugin so we can install rubies
    git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build

    # Patch rbenv into our current shell
    source $profile

    # install a version of ruby
    rbenv install 2.1.2

    # set ruby version
    rbenv global 2.1.2
fi

# get my dotfiles
dotfile_dir="$HOME/.dotfiles"
if [ ! -d "$dotfile_dir" ]; then
    prev_dir=`pwd`
    git clone git@github.com:jamesleonis/dotfiles.git $dotfile_dir
    cd $dotfile_dir
    ./scripts/install
    cd $prev_dir
fi

# get Dropbox
if [ ! -d "$HOME/.dropbox-dist" ]; then
    prev_dir=`pwd`
    cd $HOME
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    $HOME/.dropbox-dist/dropboxd &
    cd $prev_dir
fi

# get BitTorrent Sync
if [ ! -d "$HOME/.btsync" ]; then
    #download and install
    prev_dir=`pwd`
    mkdir $HOME/.btsync
    cd $HOME/.btsync
    wget -O - "http://download-lb.utorrent.com/endpoint/btsync/os/linux-glibc23-x64/track/stable" | tar xzf -
    $HOME/.btsync/btsync &
    cd $prev_dir
fi

# setup a key for ssh (Github, et al)
if [ ! -s "$HOME/.ssh/id_rsa.pub" ]; then
    ssh-keygen -t rsa -C "me@jamesleonis.com" -f "$HOME/.ssh/id_rsa"
    xclip -sel clip < "$HOME/.ssh/id_rsa.pub"
    read -p "Copy into GitHub. Press enter when done..."
fi

# install other interesting programs
sudo apt-get -y install chromium-browser vlc keepass2 xdotool 
