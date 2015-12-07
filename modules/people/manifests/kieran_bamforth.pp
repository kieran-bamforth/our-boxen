
class people::kieran_bamforth {

  $home     = "/Users/${::boxen_user}"
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
}