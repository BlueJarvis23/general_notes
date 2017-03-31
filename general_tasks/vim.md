
# vim.md

## Install Plugins in Vim
Plugins in Vim come in 3 types.
    - Regular .vim files
    - Vimball files
    - Set of directories that follow an expected structure ( plugin, syntax, etc... )
Single .vim files should be put in the .vim/plugin directory.
A Vimball can be install by opening it in Vim and running `:source %`
The expected directory structure should be put in ~/.vim/bundle/PLUGIN_NAME

I use Pathogen to add the plugin source to Vim. 
To install Pathogen:
    - create the `pathogen.vim` file at ~/.vim/autoload/pathogen.vim
    - Create the ~/.vim/bundle directory if it does not exist
    - Add `execute pathogen#infect()` to the top of your .vimrc file
At this point you are done.

Everything can be checked to make sure it is working by typeing: `:set runtimepath?` in Vim. This 
is to make sure that the your plugin gets added to the path.

**Note** use pathogen's :Helptags command to then be able to access the help pages for your plugin.


## Spell Check

:set spell
:set nospell
[s or ]s
z=
:spellr
:spellrepall


## Reformat Text Width

:set textwidth=80
v
gq


