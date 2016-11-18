# Project Manifests

class projects::infrastructureca {
	$repoName = "infrastructure-ca"
  $projectDir = "${boxen::config::srcdir}/${repoName}"
  $dirCa = "${projectDir}/ca.crt"

  mydocker::installnode { 'single-master':
    hostname => "single-master.docker.kieranbamforth.me",
    dir => "${projectDir}/docker-nodes",
    cafile => "${dirCa}",
    require => Boxen::Project[$repoName]
  }

	boxen::project { $repoName:
		source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
	}

}
