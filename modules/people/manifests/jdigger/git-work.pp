class people::jdigger::git-work {

  $home = "/Users/${::boxen_user}"
  $srcdir = "${home}/src"

  Repository { 
    provider => git,
  }

  repository { "${srcdir}/omega" :
    source => 'git@github.webapps.rr.com:webcms/omega.git',
    path => "${srcdir}/omega",
  }
  ->
  git::config::local { "${srcdir}/omega":
    key    => 'user.email',
    value  => 'james.moore3@twcable.com',
  }

  repository { "${srcdir}/cq-gradle-plugins" :
    source => 'https://github.webapps.rr.com/webcms/cq-gradle-plugins.git',
    path => "${srcdir}/cq-gradle-plugins",
    provider => git
  }
  ->
  git::config::local { "${srcdir}/cq-gradle-plugins":
    key    => 'user.email',
    value  => 'james.moore3@twcable.com',
  }

  repository { "${srcdir}/git-process" :
    source => 'https://github.com/jdigger/git-process.git',
    path => "${srcdir}/git-process",
    provider => git
  }
  ->
  git::config::local { "${srcdir}/git-process":
    key    => 'user.email',
    value  => 'moore.jim@gmail.com',
  }

}
