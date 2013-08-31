node.default[:user_home] = "/Users/#{ENV['CHEF_USERNAME']}"
node.default[:current_user] = ENV['CHEF_USERNAME']
node.default[:current_group] = ENV['CHEF_GROUP']
node.default[:github][:login] = ENV['CHEF_USERNAME']

node.default[:chefsen][:home]              = '/usr/local/chefsen'
node.default[:chefsen][:bindir]            = '/usr/local/bin'
node.default[:chefsen][:cachedir]          = '/usr/locaL/var/cache'
node.default[:chefsen][:configdir]         = '/usr/local/etc'
node.default[:chefsen][:datadir]           = '/usr/local/var/lib'
node.default[:chefsen][:envdir]            = '/usr/local/etc/env.d'
node.default[:chefsen][:homebrewdir]       = '/usr/local'
node.default[:chefsen][:logdir]            = '/usr/local/var/log'
# node.default[:chefsen][:repodir]           = $::boxen_repodir
# node.default[:chefsen][:reponame]          = $::boxen_reponame
node.default[:chefsen][:socketdir]         = '/usr/local/var/sock'
node.default[:chefsen][:srcdir]            = "/Users/#{ENV['CHEF_USERNAME']}/.chefsen"
node.default[:chefsen][:vardir]            = '/usr/local/var'
# node.default[:chefsen][:login]             = $::github_login
# node.default[:chefsen][:repo_url_template] = $::boxen_repo_url_template