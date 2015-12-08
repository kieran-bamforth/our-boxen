# Project Manifests

class projects::dotfiles {
    $dotfiles = "dotfiles"
    $home = "/Users/${::boxen_user}"
    $dir = "${boxen::config::srcdir}/${dotfiles}"

    boxen::project { $dotfiles:
        source => 'kieran-bamforth/dotfiles'
    }

    file { "${home}/.tmux.conf":
        target => "${dir}/.tmux.conf",
        ensure => 'link',
        require => Boxen::Project[$dotfiles]
    }

    file { "${home}/.vimrc":
        target => "${dir}/.vimrc",
        ensure => 'link',
        require => Boxen::Project[$dotfiles]
    }

    file { "${home}/.zshrc":
        target => "${dir}/.zshrc",
        ensure => 'link',
        require => Boxen::Project[$dotfiles]
    }
}