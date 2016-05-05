class myterminal::pre {
    $zpdir = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins"
	file { $zpdir: 
        ensure => directory
    }

    $tpdir = [ 
		"/Users/${::boxen_user}/.tmux/", 
		"/Users/${::boxen_user}/.tmux/plugins" 
	]
	file { $tpdir: 
        ensure => directory
    }
}
