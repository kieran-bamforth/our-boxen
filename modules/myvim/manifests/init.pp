class myvim {
	include macvim
	vim::bundle { [
		'altercation/vim-colors-solarized',
		'ekalinin/Dockerfile.vim',
        'elzr/vim-json',
		'joonty/vdebug',
		'kieran-bamforth/vim-phpunit',
		'kshenoy/vim-signature',
		'Lokaltog/vim-easymotion',
		'scrooloose/nerdtree',
		'scrooloose/syntastic',
		'sjl/gundo.vim',
		'tpope/vim-commentary',
		'tpope/vim-dispatch',
		'tpope/vim-fugitive',
		'tpope/vim-sensible',
		'tpope/vim-surround'
	]: }
}
