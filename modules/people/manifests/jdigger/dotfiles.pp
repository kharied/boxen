class people::jdigger::dotfiles {
  include git

  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  git::config::local { $dotfiles:
    ensure => present,
    key    => 'user.email',
    value  => 'moore.jim@gmail.com',
    require => Repository[$dotfiles],
  }

  git::config::global {
    'user.name':
      value  => 'Jim Moore',
      require => File["${home}/.gitconfig"];

    'push.default':
      value  => 'simple',
      require => File["${home}/.gitconfig"];

    'difftool.tool':
      value  => 'p41merge',
      require => [ Package[p4merge], File["${home}/.gitconfig"] ];

    'core.editor':
      value  => 'subl -w',
      require => [ Package[SublimeText2], File["${home}/.gitconfig"] ];

    'core.autocrlf':
      value  => 'input',
      require => File["${home}/.gitconfig"];

    'core.safecrlf':
      value  => 'warn',
      require => File["${home}/.gitconfig"];
  }

  repository { $dotfiles :
    source => 'git@bitbucket.org:jdigger/dotfiles.git',
    path => $dotfiles,
    provider => git
  }

  repository { 'oh-my-zsh' :
    source => 'git@github.com:jdigger/oh-my-zsh.git',
    path => "${home}/.oh-my-zsh",
    provider => git
  }

  file { "${home}/.zshrc":
    ensure  => 'present',
    source  => "puppet:///modules/people/jdigger/zshrc",
  }

  file { "${home}/.zshenv":
    ensure  => 'present',
    content => template('people/jdigger/zshenv.erb')
  }

  file { "${home}/.zprofile":
    ensure  => link,
    target  => "${dotfiles}/zprofile",
    require => Repository[$dotfiles],
  }

  file { "${home}/.gitconfig":
    ensure  => link,
    target  => "${dotfiles}/gitconfig",
    require => Repository[$dotfiles],
  }

  file { "${home}/.gitignore":
    ensure  => link,
    target  => "${dotfiles}/gitignore",
    require => Repository[$dotfiles],
  }

  file { "${home}/.profile":
    ensure  => link,
    target  => "${dotfiles}/profile",
    require => Repository[$dotfiles],
  }

  file { "${home}/.shellpaths":
    ensure  => link,
    target  => "${dotfiles}/shellpaths",
    require => Repository[$dotfiles],
  }

  file { "${home}/.shellaliases":
    ensure  => link,
    target  => "${dotfiles}/shellaliases",
    require => Repository[$dotfiles],
  }

  file { "${home}/.shellvars":
    ensure  => link,
    target  => "${dotfiles}/shellvars",
    require => Repository[$dotfiles],
  }

}
