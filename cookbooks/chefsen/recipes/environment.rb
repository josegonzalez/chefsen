include_recipe "chefsen::config"
include_recipe "chefsen::gemrc"

# can be run whenever
include_recipe "chefsen::bin"
include_recipe "chefsen::janitor"
include_recipe "chefsen::personal"
include_recipe "chefsen::profile"
include_recipe "chefsen::repo"
include_recipe "chefsen::security"
include_recipe "chefsen::sudoers"
