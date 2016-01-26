# Project Manifests

class projects::dotfiles {

    $awsdir = "/Users/${::boxen_user}/.aws"
    $sshdir = "/Users/${::boxen_user}/.ssh"
    $dotfiles = "dotfiles"
    $home = "/Users/${::boxen_user}"
    $dir = "${boxen::config::srcdir}/${dotfiles}"

    #Presetup

    file { "$sshdir":
        ensure => 'directory'
    }

    file { "$awsdir":
        ensure => 'directory',
        require => File[$sshdir]
    }

    boxen::project { $dotfiles:
        source => 'https://kieran-bamforth@bitbucket.org/kieranbamforth/dotfiles.git',
        require => File[$awsdir]
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

    file { "${home}/.aws/aws_zsh_autocompleter.sh":
        target => "${dir}/.aws/aws_zsh_autocompleter.sh",
        ensure => 'link',
        require => Boxen::Project[$dotfiles]
    }

    file { "${home}/.aws/config":
        target => "${dir}/.aws/config",
        ensure => 'link',
        require => Boxen::Project[$dotfiles]
    }

    file { "${home}/.aws/credentials":
        target => "${dir}/.aws/credentials",
        ensure => 'link',
        require => Boxen::Project[$dotfiles]
    }

    file { "${home}/.ssh/config":
        target => "${dir}/.ssh/config",
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