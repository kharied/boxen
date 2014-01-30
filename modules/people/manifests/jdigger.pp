class people::jdigger {

  $home = "/Users/${::boxen_user}"

  include people::jdigger::dotfiles
  include people::jdigger::applications
  include people::jdigger::ruby
  include people::jdigger::git
  include people::jdigger::sublime_text_2

  boxen::osx_defaults { 'scrollbars always on':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleShowScrollBars',
    value  => 'Always',
    user   => $::boxen_user
  }

  # ##################################
  # ## Facter, Puppet, and Envpuppet##
  # ##################################

  # repository { "${::boxen_srcdir}/puppet":
  #   source => 'puppetlabs/puppet',
  # }

  # repository { "${::boxen_srcdir}/facter":
  #   source => 'puppetlabs/facter',
  # }

  # file { '/bin/envpuppet':
  #   ensure  => link,
  #   mode    => '0755',
  #   target  => "${::boxen_srcdir}/puppet/ext/envpuppet",
  #   require => Repository["${::boxen_srcdir}/puppet"],
  # }

  # include zsh

  ##########
  # TODO
  ##########

  # Add ~/.ssh/config
  # Add ~/.ssh/knownhosts
  # Add ~/bin/gw
  # Move dotfile management to Boxen from .dotfiles

}
