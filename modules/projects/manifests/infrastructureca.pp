# Project Manifests

class projects::infrastructureca {
  $repoName = "infrastructure-ca"
  $projectDir = "${boxen::config::srcdir}/${repoName}"
  $dirCa = "${projectDir}/ca.crt"

  mydocker::installclient { 'client':
    dir => "${projectDir}/docker-client",
    cafile => "${dirCa}",
    require => Boxen::Project[$repoName]
  }

  mydocker::installnode { 'single-master':
    client => 'client',
    hostname => "single-master.docker.kieranbamforth.me",
    require => Boxen::Project[$repoName]
  }

  mydocker::installnode { 'single-swarm-master':
    client => 'client',
    hostname => "single-master.docker-swarm.kieranbamforth.me",
    require => Boxen::Project[$repoName]
  }

  boxen::project { $repoName:
    source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
  }

}
