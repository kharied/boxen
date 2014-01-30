class people::jdigger::ruby(
        $global_version
) {

  include 'ruby'

  class { 'ruby::global':
    version => $global_version
  }

  ruby::gem { "git-process for ${global_version}":
    gem     => 'git-process',
    ruby    => $global_version,
    version => '~> 2.0'
  }

  ruby::gem { "asciidoctor for ${global_version}":
    gem     => 'asciidoctor',
    ruby    => $global_version,
    version => '~> 0.1.4'
  }

}
