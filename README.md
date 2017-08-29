James' dotfiles
===============

These are my configuration dotfiles and their respective settings. I am inspired by [Zach Holman's passionate exultations on forkable dotfiles][zach] (that sounds so wrong...), and the idea of keeping both a central repository and history strikes my efficiency drive like a hammer to an anvil. I am fired up!

[zach]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/

### Installation

There's a lot of other people's code here, and I want to keep it updated regularly and automatically.

To install, copy the following:

    git clone git://github.com/jamesleonis/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule update --init
    ./scripts/link-dotfiles.sh

The VIM plugins are managed through [Vundle][vundle]. Once the submodules are updated and the dotfiles linked, you can install it with this command:

    vim -E -s -S $HOME/.vimrc "+VundleInstall" "+qa"

Tern for JS also requires `npm install` to be run in it's directory.

[vundle]: https://github.com/VundleVim/Vundle.vim
[ycm]: https://github.com/Valloric/YouCompleteMe

### Requirements

You will need to have `git` installed for this to work.

To use Tern, you will need Node.js and NPM.
