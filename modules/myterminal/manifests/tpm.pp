class myterminal::tpm {
	$tpdir = "/Users/${::boxen_user}/.tmux/plugins"

    repository { "$tpdir/tpm":
        source => 'tmux-plugins/tpm',
    }
}
