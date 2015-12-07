
class people::kieran_bamforth {

  $home = "/Users/${::boxen_user}"

  # Dotfiles
  $dotfiles = "${home}/dotfiles"
  $dftmux = "${home}/.tmux.conf"
  $dfvimrc = "${home}/.vimrc"
  $dfzsh = "${home}/.zshrc"

  file { $dotfiles:
    ensure  => directory
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

  # ZSH Plugins
  $zpsyntaxhighlight = "$home/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

  file { $zpsyntaxhighlight: 
    ensure => directory
  }

  repository { $zpsyntaxhighlight:
    source => 'zsh-users/zsh-syntax-highlighting',
    require => File[$zpsyntaxhighlight]
  }
}