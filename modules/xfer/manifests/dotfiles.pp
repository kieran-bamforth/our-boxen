class xfer::dotfiles {
    $home = "/Users/${::boxen_user}"
    $dotfiles = "${home}/dotfiles"
    $sublimefiles = "${home}/Library/Application Support/Sublime Text 3/Packages/User"
    $dfsublime = "${sublimefiles}/Preferences.sublime-settings"
    $dftmux = "${home}/.tmux.conf"
    $dfvimrc = "${home}/.vimrc"
    $dfzsh = "${home}/.zshrc"

    file { $dotfiles:
        ensure  => 'directory',
        require => File[$sublimefiles]
    }

    repository { $dotfiles:
        source  => 'kieran-bamforth/dotfiles',
        require => File[$dotfiles]
    }

    file { $dftmux: 
        target => "$dotfiles/.tmux.conf",
        ensure => 'link',
        require => Repository[$dotfiles]
    }

    file { $dfvimrc:
        target => "$dotfiles/.vimrc",
        ensure => 'link',
        require => Repository[$dotfiles]
    }

    file { $dfzsh:
        target => "$dotfiles/.zshrc",
        ensure => 'link',
        require => Repository[$dotfiles]
    }

    file { $dfsublime:
        target => "$dotfiles/Preferences.sublime-settings",
        ensure => 'link',
    }
}