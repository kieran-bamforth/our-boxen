class myvim {
  include macvim
  vim::bundle { [
    'airblade/vim-gitgutter',
    'altercation/vim-colors-solarized',
    'ekalinin/Dockerfile.vim',
    'elzr/vim-json',
    'joonty/vdebug',
    'kieran-bamforth/vim-phpunit',
    'kshenoy/vim-signature',
    'Lokaltog/vim-easymotion',
    'rodjek/vim-puppet',
    'scrooloose/nerdtree',
    'scrooloose/syntastic',
    'sjl/gundo.vim',
    'tmux-plugins/vim-tmux-focus-events.git',
    'tpope/vim-commentary',
    'tpope/vim-dispatch',
    'tpope/vim-fugitive',
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'Valloric/YouCompleteMe',
    'vim-scripts/nginx.vim'
  ]: }
}
