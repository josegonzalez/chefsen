Chef::Log.info("Incomplete git recipe")

include_recipe 'chef-homebrew::init'

package 'git' do
  provider Chef::Provider::Package::Homebrew
  not_if 'brew list|grep git'
end

directory node[:git][:configdir]

#   file { $git::config::credentialhelper:
#     ensure => file
#   }

#   file { $git::config::global_credentialhelper:
#     ensure  => link,
#     target  => $git::config::credentialhelper,
#     before  => Package['boxen/brews/git'],
#     require => File[$git::config::credentialhelper]
#   }

template "#{node[:git][:configdir]}/gitignore" do
  mode 0644
  source "gitignore.erb"
  action :create_if_missing
end

#   git::config::global{ 'credential.helper':
#     value => $git::config::global_credentialhelper
#   }

chef_git_config 'core.excludesfile' do
  value "#{node[:git][:configdir]}/gitignore"
end

node[:git][:config].each do |namespace, config|
  config.each do |k, v|
    next unless v.instance_of? String
    chef_git_config "#{namespace}.#{k}" do
      value v
    end
  end
end
