class myvim {
  include macvim
  include vimtmuxnavigator
  vim::bundle { [
    'airblade/vim-gitgutter',
    'altercation/vim-colors-solarized',
    'ekalinin/Dockerfile.vim',
    'beyondwords/vim-twig',
    'elzr/vim-json',
    'joonty/vdebug',
    'kieran-bamforth/vim-phpunit',
    'kshenoy/vim-signature',
    'Lokaltog/vim-easymotion',
    'mattn/emmet-vim',
    'rodjek/vim-puppet',
    'scrooloose/nerdtree',
    'scrooloose/syntastic',
    'sjl/gundo.vim',
    'shawncplus/phpcomplete.vim',
    'tmux-plugins/vim-tmux-focus-events.git',
    'tpope/vim-commentary',
    'tpope/vim-dispatch',
    'tpope/vim-fugitive',
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'tpope/vim-unimpaired.git',
    'Valloric/YouCompleteMe',
    'vim-scripts/nginx.vim',
    'xolox/vim-easytags',
    'xolox/vim-misc'
  ]: }
}
