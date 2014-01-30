class people::jdigger {

  include people::jdigger::dotfiles
  include people::jdigger::applications
  include people::jdigger::ruby
  include people::jdigger::git
  include people::jdigger::sublime_text_2
  include people::jdigger::osx

  ##########
  # TODO
  ##########

  # Add ~/.ssh/config
  # Add ~/.ssh/knownhosts
  # Add ~/bin/gw
  # Move dotfile management to Boxen from .dotfiles

}
