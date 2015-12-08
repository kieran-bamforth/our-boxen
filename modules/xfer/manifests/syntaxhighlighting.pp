class xfer::syntaxhighlighting {
	$zpsyntaxhighlight = "/Users/${::boxen_user}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    repository { $zpsyntaxhighlight:
        source => 'zsh-users/zsh-syntax-highlighting',
    }
}