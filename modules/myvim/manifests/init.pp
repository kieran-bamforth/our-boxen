class myvim {
	include macvim
	vim::bundle { [
		'altercation/vim-colors-solarized',
		'elzr/vim-json',
		'joonty/vdebug',
		'Lokaltog/vim-easymotion',
		'scrooloose/nerdtree',
		'scrooloose/syntastic',
		'sjl/gundo.vim',
		'tpope/vim-commentary',
		'tpope/vim-fugitive',
		'tpope/vim-sensible',
		'tpope/vim-surround'
	]: }
}
