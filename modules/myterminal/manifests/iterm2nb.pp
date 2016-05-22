class myterminal::iterm2nb {

	$applications = "/Users/${::boxen_user}/Applications"
	$iterm2nb = "${applications}/iTerm2NB"

    repository { $iterm2nb:
        source => 'simar7/iTerm2',
    }
    
    file { "${applications}/iTerm":
        target => "${iterm2nb}/build/Development/iTerm.app",
        ensure => 'link',
        require => Repository[$iterm2nb]
    }
}

