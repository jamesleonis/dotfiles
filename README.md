James' dotfiles
===============

These are my configuration dotfiles and their respective settings. I am inspired by [Zach Holman's passionate exultations on forkable dotfiles][zach] (that sounds so wrong...), and the idea of keeping both a central repository and history strikes my efficiency drive like a hammer to an anvil. I am fired up!

[zach]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/

### Installation

There's a lot of other people's code here, and I want to keep it updated regularly and automatically.

To install, copy the following:

    git clone git://github.com/jamesleonis/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    scripts/install

The VIM plugins are managed through [Vundle][vundle]. See it's README for how to install/update the plugins.

NOTE: YouCompleteMe takes a while to install, and still needs to run the `./install.sh`. See the [README][ycm] for specific instructions.

[vundle]: https://github.com/VundleVim/Vundle.vim
[ycm]: https://github.com/Valloric/YouCompleteMe

### Requirements

You will need to have `git` and `ruby` installed for this to work.
