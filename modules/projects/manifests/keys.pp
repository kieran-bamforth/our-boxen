# Project Manifests

class projects::keys {

	$keys = "keys"
	$sshdir = "/Users/${::boxen_user}/.ssh"
	$projectdir = "${boxen::config::srcdir}/${keys}"

    boxen::project { $keys:
        source => 'https://kieran-bamforth@bitbucket.org/kieranbamforth/keys.git'
    }

    # Keys

    file { "${sshdir}/id_rsa":
        target => "${projectdir}/personal/kieranbamforth",
        ensure => 'link',
        require => Boxen::Project[$keys]
    }

    file { "${sshdir}/id_rsa.pub":
        target => "${projectdir}/personal/kieranbamforth.pub",
        ensure => 'link',
        require => Boxen::Project[$keys]
    }
}