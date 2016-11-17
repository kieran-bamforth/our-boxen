class myterminal::ctags {
  homebrew::tap { 'universal-ctags/universal-ctags': }

  package { 'universal-ctags':
    ensure => present,
    install_options => [
      '--HEAD'
    ]
  }
}
