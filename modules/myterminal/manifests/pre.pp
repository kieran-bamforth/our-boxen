class myterminal::pre {
    $zpdir = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins"
	file { $zpdir: 
        ensure => directory
    }
}