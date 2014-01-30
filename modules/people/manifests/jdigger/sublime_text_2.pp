class people::jdigger::sublime_text_2 {

  include sublime_text_2

  file { "${people::jdigger::home}/bin":
     ensure => directory,
  }

  file { "${people::jdigger::home}/bin/subl":
     ensure => 'link',
     target => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
     require => [ Package[SublimeText2], File["${people::jdigger::home}/bin"] ]
  }


  ########################################
  #
  # Sublime Text 2 Packages
  #
  ########################################

  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  # sublime_text_2::package { 'Package Control':
  #   source => 'wbond/sublime_package_control'
  # }

  sublime_text_2::package { 'Sublime Linter':
    source => 'SublimeLinter/SublimeLinter'
  }

  sublime_text_2::package { 'SublimeCodeIntel':
    source => 'SublimeCodeIntel/SublimeCodeIntel'
  }

  sublime_text_2::package { 'sublime-text-git':
    source => 'kemayo/sublime-text-git'
  }

  sublime_text_2::package { 'SublimePrettyJson':
    source => 'dzhibas/SublimePrettyJson'
  }

  sublime_text_2::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet'
  }

  sublime_text_2::package { 'GitGutter':
    source => 'jisaacks/GitGutter'
  }

  sublime_text_2::package { 'SublimeLinter':
    source => 'SublimeLinter/SublimeLinter'
  }

  sublime_text_2::package { 'SideBarEnhancements':
    source => 'titoBouzout/SideBarEnhancements'
  }

  sublime_text_2::package { 'AsciiDoc':
    source => 'SublimeText/AsciiDoc'
  }

  sublime_text_2::package { 'sublimetext-Pandoc':
    source => 'tbfisher/sublimetext-Pandoc'
  }

}
