class myterminal::autosuggestions {
  $zpautosuggestions = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
  repository { $zpautosuggestions:
    source => 'zsh-users/zsh-autosuggestions'
  }
}
