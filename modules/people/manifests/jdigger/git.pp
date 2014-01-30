class people::jdigger::git(
  $system_roles = undef
) {

  $hsystem_roles = hiera_array('people::jdigger::system_roles')
  $roles = $system_roles ? { undef => $hsystem_roles, default => $system_roles}

  include git

  $srcdir = "${::people::jdigger::home}/src"

  Repository { 
    provider => git,
  }

  if member($roles, 'work') {

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
  elsif member($roles, 'personal') {

    repository { "${srcdir}/flickr2picasa" :
      source => 'git@bitbucket.org:jdigger/flickr2picasa.git',
      path => "${srcdir}/flickr2picasa",
    }


    repository { "${srcdir}/flickr" :
      source => 'https://jdigger@bitbucket.org/jdigger/flickr.git',
      path => "${srcdir}/flickr",
    }
    ->
    git::config::local { "${srcdir}/flickr":
      key    => 'user.email',
      value  => 'moore.jim@gmail.com',
    }


    repository { "${srcdir}/spring-social-flickr" :
      source => 'https://github.com/jdigger/spring-social-flickr.git',
      path => "${srcdir}/spring-social-flickr",
    }

  }
  else {
    $roles_str = join($roles, ', ')
    notify {"system_role is neither personal or work: ${roles_str}" :}
  }

}
