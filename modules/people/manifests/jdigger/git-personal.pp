class people::jdigger::git-personal {

  $home = "/Users/${::boxen_user}"
  $srcdir = "${home}/src"

  Repository { 
    provider => git,
  }

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
    path => "${srcdir}/spring-social-flickrZZ",
  }

}
