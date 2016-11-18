# Project Manifests

class projects::infrastructureca {
	require projects::dotfiles
	$repoName = "infrastructure-ca"

  $dirHome = "/Users/${::boxen_user}"
  $dirDocker = "${dirHome}/.docker"
  $dirDockerSingleMaster = "${dirDocker}/single-master.docker.kieranbamforth.me"
  $dirDockerSwarmSingleMaster = "${dirDocker}/single-master.docker-swarm.kieranbamforth.me"

  # Ensure target directories exist

  file { "$dirDocker":
    ensure => 'directory',
    before => Boxen::Project[$repoName]
  }
  file { "$dirDockerSingleMaster":
    ensure => 'directory',
    before => Boxen::Project[$repoName]
  }
  file { "$dirDockerSwarmSingleMaster":
    ensure => 'directory',
    before => Boxen::Project[$repoName]
  }

	boxen::project { "${repoName}":
		source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
	}

}
