class vimtmuxnavigator {
	$vimtmuxnavigator = "/Users/${::boxen_user}/.vim/bundle/vim-tmux-navigator"
    repository { $vimtmuxnavigator:
        source => 'christoomey/vim-tmux-navigator',
    }
}
