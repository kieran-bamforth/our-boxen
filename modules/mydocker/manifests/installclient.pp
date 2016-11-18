define mydocker::installclient(
  $dir,
  $cafile
) {
  require mydocker::config

  $dirDocker = "/Users/${::boxen_user}/.docker"

  $loc = "${dirDocker}/${name}"

  file { "$loc":
    ensure => 'directory',
  }

  file { "${loc}/ca.pem":
    target => "${cafile}",
    ensure => 'link',
    require => File[$loc]
  }

  file { "${loc}/cert.pem":
    target => "${dir}/${name}.crt",
    ensure => 'link',
    require => File[$loc]
  }

  file { "${loc}/key.pem":
    target => "${dir}/${name}-key.pem",
    ensure => 'link',
    require => File[$loc]
  }

}
