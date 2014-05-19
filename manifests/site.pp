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
    "${boxen::config::home}/homebrew/bin",
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
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_10

  # default ruby versions
  # ruby::version { '2.1.0': }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}

include vagrant

include osx::global::disable_key_press_and_hold
include osx::global::enable_keyboard_control_access
include osx::global::enable_standard_function_keys
include osx::global::expand_print_dialog
include osx::global::expand_save_dialog

include osx::dock::clear_dock

include osx::finder::unhide_library

include osx::disable_app_quarantine
include osx::software_update

class { 'osx::dock::position':
    position => 'left'
}

include iterm2::stable

include alfred

include virtualbox

include flux

include onepassword

include dropbox

include shortcat

include dash

include chrome

include phpstorm

include sequel_pro

include mou

include spotify

include zsh

include gitx

include tmux

include sublime_text_2

sublime_text_2::package { 'Emmet':
  source => 'sergeche/emmet-sublime'
}
sublime_text_2::package { 'Theme - Soda':
  source => 'buymeasoda/soda-theme'
}
sublime_text_2::package { 'SideBarEnhancements':
  source => 'titoBouzout/SideBarEnhancements'
}
sublime_text_2::package { 'HTML5':
  source => 'mrmartineau/HTML5'
}
sublime_text_2::package { 'SublimeCodeIntel':
  source => 'SublimeCodeIntel/SublimeCodeIntel'
}
sublime_text_2::package { 'BracketHighlighter':
  source => 'facelessuser/BracketHighlighter'
}
sublime_text_2::package { 'SASS':
  source => 'nathos/sass-textmate-bundle'
}
sublime_text_2::package { 'DocBlockr':
  source => 'spadgos/sublime-jsdocs'
}
sublime_text_2::package { 'SublimeREPL':
  source => 'wuub/SublimeREPL'
}
sublime_text_2::package { 'LiveReload':
  source => 'dz0ny/LiveReload-sublimetext2'
}
sublime_text_2::package { 'TrailingSpaces':
  source => 'SublimeText/TrailingSpaces'
}
sublime_text_2::package { 'FileDiffs':
  source => 'colinta/SublimeFileDiffs'
}
sublime_text_2::package { 'JSHint':
  source => 'uipoet/sublime-jshint'
}
sublime_text_2::package { 'Can I Use':
  source => 'Azd325/sublime-text-caniuse'
}
sublime_text_2::package { 'SublimeGit':
  source => 'SublimeGit/SublimeGit'
}

file { '/usr/local/bin/subl':
   ensure => 'link',
   target => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
}

include slack

include php::5_3_3

include php::composer

class { 'php::global':
  version => '5.3.3'
}

php::extension::xdebug { 'xdebug for ${version}':
  php => $version,
  version => '5.3.3'
}

include wget

include autoconf

include libtool

include pkgconfig

include pcre

include libpng

include mysql
