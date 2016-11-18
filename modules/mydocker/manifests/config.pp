class mydocker::config {
  $dirDocker = "/Users/${::boxen_user}/.docker"

  file { "$dirDocker":
    ensure => 'directory',
  }
}
