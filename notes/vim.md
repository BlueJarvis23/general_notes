
# vim.md

## Install Plugins in Vim
Plugins in Vim come in 3 types.

* Regular .vim files
* Vimball files
* Set of directories that follow an expected structure ( plugin, syntax, etc... )

Single .vim files should be put in the .vim/plugin directory.
A Vimball can be install by opening it in Vim and running `:source %`
The expected directory structure should be put in ~/.vim/bundle/PLUGIN_NAME

I use Pathogen to add the plugin source to Vim. 
To install Pathogen:

* create the `pathogen.vim` file at ~/.vim/autoload/pathogen.vim
* Create the ~/.vim/bundle directory if it does not exist
* Add `execute pathogen#infect()` to the top of your .vimrc file

At this point you are done.

Everything can be checked to make sure it is working by typeing: `:set runtimepath?` in Vim. This 
is to make sure that the your plugin gets added to the path.

**Note:** use pathogen's :Helptags command to then be able to access the help pages for your plugin.

### Vundle Plugin Manager
A Plugin Manager has many advantages over manually installing plugins because they can easily been
installed/removed and updated.

To install vundle follow the instructions on the VundleVim/Vundle.vim plugin on GitHub and add the
following code to the top of your .vimrc.

```vim
" ~~~~~~~~~~  Vundle Plugin Manager  ~~~~~~~~~~ "
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'DrawIt'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
```


## Spell Check

* :set spell
* :set nospell
* [s or ]s
* z=
* :spellr
* :spellrepall


## Reformat Text Width

1. :set textwidth=140
1. v
1. gq


