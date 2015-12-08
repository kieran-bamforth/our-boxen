# Project Manifests

class projects::dotfiles {

    $dotfiles = "dotfiles"
    $home = "/Users/${::boxen_user}"
    $dir = "${boxen::config::srcdir}/${dotfiles}"

    boxen::project { $dotfiles:
        source => 'kieran-bamforth/dotfiles'
    }

    # Dotfiles

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

    # Sublime

    require sublime_text_3::config

    file { "${sublime_text_3::config::user_packages_dir}/Preferences.sublime-settings":
        target => "${dir}/Preferences.sublime-settings",
        ensure => 'link',
        require => File[
            $sublime_text_3::config::dir,
            $sublime_text_3::config::packages_dir,
            $sublime_text_3::config::installed_packages_dir
        ]
    }
}