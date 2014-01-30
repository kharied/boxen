class people::jdigger::applications {

  package { 'sbt' :
    provider => homebrew,
  }

  # package { 'launchbar' :
  #   source => 'http://www.obdev.at/downloads/launchbar/LaunchBar-5.6.dmg',
  #   provider => appdmg_eula
  # }

  package { 'intellij' :
    source => 'http://download.jetbrains.com/idea/ideaIU-12.1.6.dmg',
    provider => appdmg,
  }

  # package { 'Firefox' :
  #   source => 'http://download-installer.cdn.mozilla.net/pub/firefox/releases/26.0/mac/en-US/Firefox%2026.0.dmg',
  #   provider => appdmg
  # }

  # package { 'Skype' :
  #   source => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/Skype_6.9.0.701.dmg',
  #   provider => appdmg
  # }

  package { 'adium' :
    source => 'http://downloads.sourceforge.net/project/adium/Adium_1.5.8.dmg',
    provider => appdmg,
  }

  package { 'p4merge':
    source => 'http://www.perforce.com/downloads/perforce/r13.3/bin.macosx106x86/P4V.dmg',
    provider => appdmg,
  }

  # File transfer application (S3, SFTP, etc)
  package { 'cyberduck':
    source => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/Cyberduck-4.3.1.zip',
    provider => compressed_app,
  }


  # Bookmark manager
  # http://www.sheepsystems.com/products/bkmx/
  package { 'BookMacster':
    source => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/BookMacster-1.19.1.zip',
    provider => compressed_app,
  }


  # Lastpass Password manager
  # http://lastpass.com/
  package { 'Lastpass':
    source => 'https://lastpass.com/download/cdn/lpmacosx.dmg',
    provider => pkgdmg,
    require => [ Package[Chrome], Package[Firefox] ],
  }


  # Window mover, resizer and more
  # http://www.binarybakery.com/product.php?app=windownaut
  package { 'Windownaut':
    source => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/Windownaut-1.2.6.dmg',
    provider => appdmg,
  }


  # DVD Ripper
  # http://www.macxdvd.com/mac-dvd-ripper-pro/
  package { 'MacxDvdRipperPro':
    source => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/macx-dvd-ripper-pro-4.4.4.dmg',
    provider => appdmg,
  }


  # Steam gaming platform
  # http://www.steampowered/
  package { 'SteamGames':
    source => 'http://media.steampowered.com/client/installer/steam.dmg',
    provider => appdmg_eula,
  }


  # TrueCrypt encryption
  # http://www.truecrypt.org/
  package { 'TrueCrypt':
    source => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/TrueCrypt-7.1a-OSX.dmg',
    provider => pkgdmg,
    require => Package[osxfuse],
  }


  # Hermes Pandora player
  # http://alexcrichton.com/hermes/
  package { 'HermesPandora':
    source => 'https://s3.amazonaws.com/alexcrichton-hermes/Hermes-1.1.20.zip',
    provider => compressed_app,
  }


  package { 'osxfuse':
    provider => homebrew,
  }


  package { 'graphviz':
    provider => homebrew,
  }


  package { 'heroku':
    provider => homebrew,
  }

}
