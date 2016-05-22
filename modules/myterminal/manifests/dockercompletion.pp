class myterminal::dockercompletion {
    $dockercompletion = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins/docker"
    repository { $dockercompletion:
        source => 'felixr/docker-zsh-completion',
    }
}
