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

  file { '/usr/local/bin/subl':
     ensure => 'link',
     target => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
  }

  include alfred
  include ansible
  include autoconf
  include chrome
  # include dnsmasq
  include dropbox
  include docker
  include elasticsearch
  include evernote
  include firefox
  include flux
  include git
  include gitx
  include hub
  include iterm2::colors::solarized_dark
  include iterm2::stable
  include java
  include libpng
  include libtool

  include memcached
  include mysql
  mysql::db {'mydb':}
  mysql::db {'mediatank-datawarehouse':}
  mysql::db {'mediatank-identity':}
  mysql::db {'mediatank-assets':}
  mysql::db {'wrapitin':}
  mysql::db {'es6_example':}
  mysql::db {'skylab_website':}
  mysql::db {'swimming':}
  # include nginx

  nodejs::version { '0.12.0': }
  npm_module { "bower for 0.12": module => 'bower', version => '~> 1.4.1', node_version => '0.12.0' }
  npm_module { "yo for 0.12": module => 'yo', version => '~> 1.4.7', node_version => '0.12.0' }
  npm_module { "node inspector for 0.12": module => 'node-inspector', version => '~> 0.12.1', node_version => '0.12.0' }
  npm_module { "git commander for 0.12": module => 'git-commander', version => '~> 0.0.12', node_version => '0.12.0' }
  npm_module { "grunt for 0.12": module => 'grunt', version => '~> 0.4.5', node_version => '0.12.0' }
  npm_module { "grunt-cli for 0.12": module => 'grunt-cli', version => '~> 0.1.13', node_version => '0.12.0' }
  npm_module { "ract-native-cli for 0.12": module => 'react-native-cli', version => '~> 0.1.4', node_version => '0.12.0' }
  class { 'nodejs::global': version => '0.12.0' }

  include osx::disable_app_quarantine
  include osx::dock::clear_dock
  include osx::finder::unhide_library
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::enable_standard_function_keys
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::software_update
  class { 'osx::dock::position': position => 'left'}
  class { 'osx::dock::icon_size': size => 36}

  include pcre

  class { 'php::global': version => '5.6.9'}
  include php::composer
  php::extension::intl { 'intl for 5.6.9': php => '5.6.9', version => '3.0.0'}
  php::extension::xdebug { 'xdebug for 5.6.9': php => '5.6.9', version => '2.3.2' }

  include phpstorm
  include pkgconfig

  python::version { '2.7.6': }
  class { 'python::global': version => '2.7.6' }

  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }

  include sequel_pro
  include skype
  include spotify

  include sublime_text_2
  sublime_text_2::package { 'BracketHighlighter': source => 'facelessuser/BracketHighlighter' }
  sublime_text_2::package { 'SideBarEnhancements': source => 'titoBouzout/SideBarEnhancements' }
  sublime_text_2::package { 'sublime-text-puppet': source => 'eklein/sublime-text-puppet' }
  sublime_text_2::package { 'TrailingSpaces': source => 'SublimeText/TrailingSpaces' }

  include tmux
  class { 'vagrant': completion => true }
  include vagrant_manager

  include vim
  vim::bundle { [
    'altercation/vim-colors-solarized',
    'elzr/vim-json',
    'Lokaltog/vim-easymotion',
    'scrooloose/nerdtree',
    'scrooloose/syntastic',
    'sjl/gundo.vim',
    'tpope/vim-commentary',
    'tpope/vim-fugitive'
  ]: }

  include virtualbox
  include wget
  include zsh
}
