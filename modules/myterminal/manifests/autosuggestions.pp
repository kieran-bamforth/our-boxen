class myterminal::autosuggestions {
	$zpautosuggestions = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    repository { $zpautosuggestions:
        source => 'tarruda/zsh-autosuggestions',
    }
}