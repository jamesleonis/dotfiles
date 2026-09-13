James' dotfiles
===============

These are my configuration dotfiles and their respective settings. I am inspired by [Zach Holman's passionate exultations on forkable dotfiles][zach] (that sounds so wrong...), and the idea of keeping both a central repository and history strikes my efficiency drive like a hammer to an anvil. I am fired up!

[zach]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/

### Requirements

* `git`

### Installation

There's a lot of other people's code here, and I want to keep it updated regularly and automatically. The `scripts/install.sh` handles automatic installation.

#### Manual install, for all the sickos (ha ha ha! yes!)

Get a copy of the dotfiles:

    git clone git://gitlab.com/jamesleonis/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles

Initialize any submodules and symlink dotfiles to their proper locations.

    git submodule update --init
    ./scripts/link-dotfiles.sh

The VIM plugins are managed through [VIM-Plug][vim-plug]. Once the submodules are updated and the dotfiles linked, you can install it with this command:

    vim -E -s -S $HOME/.vimrc "+PlugInstall" "+qa"
    nvim -E -s -S $HOME/.vimrc "+PlugInstall" "+qa"

(Neo)VIM plugins can be updated with the `:PlugUpdate` command.

**NOTE:** VIM and NeoVIM have conditionally added plugins, mainly Clojure, so the install must be run for both.

### Notes

Each root folder represents a program's collection of dotfiles laid out to mirror their `$HOME` directory location. The `link-dotfiles.sh` script locates all the `*.symlink` files and folders and symlinks them to their proper `$HOME` directory location, complete with the `.` prefix for hidden files.

[vim-plug]: https://github.com/junegunn/vim-plug

