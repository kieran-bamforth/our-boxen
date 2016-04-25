class myterminal {
	include iterm2::stable
	include tmux
	include zsh

    require myterminal::pre
    
    include myterminal::autojump
    include myterminal::autosuggestions
    include myterminal::enhancd
    include myterminal::fzf
    include myterminal::powerline
    include myterminal::syntaxhighlighting
    include myterminal::tree
}
