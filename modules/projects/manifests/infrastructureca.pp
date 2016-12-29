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

  mydocker::installnode { 'swarm.shared.kieranbamforth.me':
    client => 'client',
    hostname => "swarm.shared.kieranbamforth.me",
    port => 3376,
    require => Boxen::Project[$repoName]
  }

  boxen::project { $repoName:
    source => "git@bitbucket.org:kieranbamforth/${repoName}.git"
  }

}
