class myterminal::enhancd {
  $direnhancd = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins/enhancd"
  repository { $direnhancd:
    source => 'b4b4r07/enhancd',
  }

  file { "$direnhancd/enhancd.sh":
    mode => '755',
    require => Repository[$direnhancd]
  }
}
