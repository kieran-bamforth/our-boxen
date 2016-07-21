# Project Manifests

class projects::dotfiles {

    # Setup variables

    $repoName = "dotfiles"

    $dirHome = "/Users/${::boxen_user}"
    $dirPreferences = "${dirHome}/Library/Preferences"
    $dirAws = "${dirHome}/.aws"
    $dirConfig = "${dirHome}/.config"
    $dirSsh = "${dirHome}/.ssh"
    $dirKeys = "${dirSsh}/keys"

    $projectDir = "${boxen::config::srcdir}/${repoName}"
    $projectDirAws = "${projectDir}/.aws"
    $projectDirSsh = "${projectDir}/.ssh"
    $projectDirKeys = "${projectDirSsh}/keys"

    # Ensure target directories exist

    file { "$dirAws":
        ensure => 'directory',
        before => Boxen::Project[$repoName]
    }
    file { "$dirConfig":
        ensure => 'directory',
        before => Boxen::Project[$repoName]
    }
    file { "$dirSsh":
        ensure => 'directory',
        before => Boxen::Project[$repoName]
    }

    # Clone the project. Note the HTTPS method is used so that this project
    # can be cloned without needing the required SSH BitBucket key.

    boxen::project { $repoName:
        source => "https://kieran-bamforth@bitbucket.org/kieranbamforth/${repoName}.git"
    }

    # AWS config

    file { "${dirAws}/aws_zsh_autocompleter.sh":
        target => "${projectDirAws}/aws_zsh_autocompleter.sh",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
    file { "${dirAws}/config":
        target => "${projectDirAws}/config",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }

    # SSH config

    file { "${dirSsh}/id_rsa":
        target => "${projectDirKeys}/personal/kieranbamforth",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
    file { "${dirSsh}/id_rsa.pub":
        target => "${projectDirKeys}/personal/kieranbamforth.pub",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
    file { "${dirSsh}/config":
        target => "${projectDirSsh}/config",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
    file { "${dirKeys}":
        target => "${projectDirKeys}",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }

    # Powerline

    file { "${dirConfig}/powerline":
        target => "${projectDir}/.config/powerline",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
	
	# Dotfiles

    file { "${dirHome}/.fzf.zsh":
        target => "${projectDir}/.fzf.zsh",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
    file { "${dirHome}/.tmux.conf":
        target => "${projectDir}/.tmux.conf",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
    file { "${dirHome}/.vimrc":
        target => "${projectDir}/.vimrc",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }
    file { "${dirHome}/.zshrc":
        target => "${projectDir}/.zshrc",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }

    # Sublime

    require sublime_text_3::config
    file { "${sublime_text_3::config::user_packages_dir}/Preferences.sublime-settings":
        target => "${projectDir}/Preferences.sublime-settings",
        ensure => 'link',
        require => File[
            $sublime_text_3::config::dir,
            $sublime_text_3::config::packages_dir,
            $sublime_text_3::config::installed_packages_dir
        ]
    }

    # iTerm2

    file { "${dirPreferences}/com.googlecode.iterm2.plist":
        target => "${projectDir}/com.googlecode.iterm2.plist",
        ensure => 'link',
        require => Boxen::Project[$repoName]
    }

    # Fix the keys permissions

    file { "${projectDirKeys}/bitbucket/bitbucket-kieran-bamforth":
        mode => "400",
        require => Boxen::Project[$repoName]
    }
    file { "${projectDirKeys}/github/github-kieran-bamforth":
        mode => "400",
        require => Boxen::Project[$repoName]
    }
    file { "${projectDirKeys}/personal/kieranbamforth":
        mode => "400",
        require => Boxen::Project[$repoName]
    }
    file { "${projectDirKeys}/personal/kieranbamforth.pub":
        mode => "400",
        require => Boxen::Project[$repoName]
    }
    file { "${projectDirKeys}/personal/jenkins":
        mode => "400",
        require => Boxen::Project[$repoName]
    }
}
