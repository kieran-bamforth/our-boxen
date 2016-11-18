define mydocker::installnode(
  $client,
  $hostname
) {
  require mydocker::config

  $dirDocker = "/Users/${::boxen_user}/.docker"
  $certPath = "${dirDocker}/${client}"
  $loc = "${dirDocker}/${name}"

  file { "$loc":
    ensure => 'directory',
  }

  file { "${loc}/env.sh":
    ensure => file,
    content => template('mydocker/env.sh.erb'),
    mode => 755
  }

}
