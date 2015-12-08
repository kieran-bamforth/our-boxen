class xfer::enhancd {
	$home = "/Users/${::boxen_user}"

	package { 'fzf':
      ensure => present
    }

    $direnhancd = "$home/.oh-my-zsh/custom/plugins/enhancd"

    file { $direnhancd:
    	ensure => directory
    }

    repository { $direnhancd:
    	source => 'b4b4r07/enhancd',
    	require => File[$direnhancd]
    }

    file { "$direnhancd/enhancd.sh":
    	mode => '755',
    	require => Repository[$direnhancd]
	}
}