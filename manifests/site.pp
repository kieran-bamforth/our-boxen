require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }
  package { [
      'ack',
      'findutils',
      'gnu-tar'
  ]: }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  include ansible
  include autoconf
  # include cachegrind
  # include dnsmasq
  # include docker
  # include elasticsearch
  include git
  include gitx
  include hub
  include java
  include libpng
  include libtool
  include memcached
  # include nginx
  include pcre
  include pkgconfig
  # include::tunnelblick
  include wget

  include myapps
  include mymysql
  include mynodejs
  include myosx
  include myphp
  include mypython
  include myruby
  include mysublimetext
  include myterminal
  include myvim
}
