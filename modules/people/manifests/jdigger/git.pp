class people::jdigger::git (
  $system_roles = undef
) {

  $_system_roles = hiera_array('people::jdigger::system_roles')
  $roles = $system_roles ? { undef => $_system_roles, default => $system_roles}

  include git

  Repository { 
    provider => git,
  }

  if member($roles, 'work') {
    include people::jdigger::git-work
  }
  elsif member($roles, 'personal') {
    include people::jdigger::git-personal
  }
  else {
    $roles_str = join($roles, ', ')
    notify {"system_role is neither personal or work: ${roles_str}" :}
  }

}
