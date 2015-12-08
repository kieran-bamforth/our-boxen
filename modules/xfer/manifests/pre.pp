class xfer::pre {
    $zpdir = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins"
	file { $zpdir: 
        ensure => directory
    }
}