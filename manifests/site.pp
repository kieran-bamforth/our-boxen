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
  # core modules, needed for most things
  #include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # install any arbitrary nodejs version
  nodejs::version { 'v0.12.0': }

  # set the global nodejs version
  class { 'nodejs::global': version => 'v0.12.0' }

  nodejs::module { 'bower':
    node_version => 'v0.12.0'
  }
  nodejs::module { 'grunt-cli':
    node_version => 'v0.12.0'
  }
  nodejs::module { 'yo':
    node_version => 'v0.12.0'
  }
  nodejs::module { 'generator-flight':
    node_version => 'v0.12.0'
  }
  nodejs::module {'node-inspector':
    node_version => 'v0.12.0'
  }

  # default ruby versions
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }

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

class { 'osx::dock::icon_size':
  size => 36
}

include iterm2::stable

include alfred

include virtualbox

include flux

#include onepassword

include dropbox

include shortcat

#include dash

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
sublime_text_2::package { 'PHP-Twig.tmbundle':
  source => 'Anomareh/PHP-Twig.tmbundle'
}
sublime_text_2::package { 'sublime-jslint':
  source => 'fbzhong/sublime-jslint'
}
sublime_text_2::package { 'sublime-text-puppet':
  source => 'eklein/sublime-text-puppet'
}

file { '/usr/local/bin/subl':
   ensure => 'link',
   target => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
}

include slack

php::version { '5.5.9': }
php::version { '5.4.17': }

include php::composer

class { 'php::global':
  version => '5.5.9'
}

php::extension::xdebug { 'xdebug for 5.4':
  php => '5.4.17'
}

php::extension::intl { 'intl for 5.4':
  php => '5.4.17'
}

#php::extension::xdebug { 'xdebug for 5.5.9':
#  php => '5.5.9'
#}

php::extension::intl { 'intl for 5.5.9':
  php => '5.5.9'
}

include wget

include autoconf

include libtool

include pkgconfig

include pcre

include libpng

include mysql

include skype

# Install Python versions
python::version { '2.7.6': }

# Set the global version of Python
class { 'python::global':
  version => '2.7.6'
}

include ansible

include evernote

include induction

include firefox

#service {"dev.nginx":
#    ensure => "started",
#}

#service {"dev.dnsmasq":
#    ensure => "stopped",
#}

include vagrant_manager

include vim

vim::bundle { [
  'scrooloose/syntastic',
  'sjl/gundo.vim',
  'elzr/vim-json',
  'altercation/vim-colors-solarized',
  'tpope/vim-commentary',
  'scrooloose/nerdtree',
  'tpope/vim-fugitive',
  'Lokaltog/vim-easymotion'
]: }

class { 'projects::mediatank': }
