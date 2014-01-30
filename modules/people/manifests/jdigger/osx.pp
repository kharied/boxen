class people::jdigger::osx {

  boxen::osx_defaults { 'scrollbars always on':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleShowScrollBars',
    value  => 'Always',
    user   => $::boxen_user
  }

}
