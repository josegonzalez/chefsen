include_attribute "chefsen::default"

node.default[:git][:config][:user][:name]     = false
node.default[:git][:config][:user][:email]    = false

node.default[:git][:configdir]                = "#{node[:chefsen][:configdir]}/git"
node.default[:git][:credentialhelper]         = "#{node[:chefsen][:repodir]}/script/boxen-git-credential"
node.default[:git][:global_credentialhelper]  = "#{node[:chefsen][:bindir]}/boxen-git-credential"

node.default[:gitx][:default_source]          = "http://frim.frim.nl/GitXStable.app.zip"
node.default[:gitx][:laullon_source]          = "https://github.com/downloads/laullon/gitx/GitX-L_v0.8.4.zip"
node.default[:gitx][:rowanj_source]           = "http://cloud.github.com/downloads/rowanj/gitx/GitX-dev-57.zip"
