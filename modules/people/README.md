# Personal Manifests

Per-user manifests live in `modules/people/manifests/${login}.pp`, where
`$login` is a GitHub login. To modularize further for a single user, create a
subdirectory with the login name and put the additional manifests in there.

A simple user manifest example:

```puppet
class people::jdigger {

  include people::jdigger::dotfiles
  include people::jdigger::applications
  include people::jdigger::ruby
  include people::jdigger::git
  include people::jdigger::sublime_text_2
  include people::jdigger::osx

}
```

## Hiera

Hiera data is also supported per-user in `config/people/${login}.yaml`
with support for multiple machines using `{boxen}/config/people/${login}/nodes/*.yaml`.

## Facter Facts

If you have private information that you want Boxen to manage but don't want to
check into this public repo (e.g., passwords, OAuth tokens, SSH config), add them
as key-value "facts" in `~/.boxen/config.json` and manage that securely seperately
(Dropbox, a USB key, etc).

## Files

Personal (but non-private!) files like your `.zshrc` that you want managed should go in
`modules/people/files/${login}/`.

An example of referencing from a manifest:

```puppet
$home     = "/Users/${::boxen_user}"

file { "${home}/.zshrc":
  ensure  => 'present',
  source  => "puppet:///modules/people/jdigger/zshrc",
}
```

## Templates

Personal files that you want to do variable substitution on (such as to insert needed private information) should go in
`modules/people/templates/${login}/`.

An example of referencing from a manifest:

```puppet
$home     = "/Users/${::boxen_user}"

file { "${home}/.zshenv":
  ensure  => 'present',
  content => template('people/jdigger/zshenv.erb')
}
```

## User Names

Note that if your GitHub username contains dashes, you should replace them by underscores in both the manifest name and the class name.

## Projects

While you _can_ include projects one by one, sometimes you might just want
all of them.
You can do that easily with:

```
include projects::all
```
