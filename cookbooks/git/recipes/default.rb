Chef::Log.info("Incomplete git recipe")

$home = "/Users/#{ENV['CHEF_USERNAME']}"

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

template "#{$home}/.gitignore" do
  mode 0644
  source "gitignore.erb"
  action :create_if_missing
end

#   git::config::global{ 'credential.helper':
#     value => $git::config::global_credentialhelper
#   }

node[:git][:config].each do |namespace, config|
  config.each do |k, v|
    git_config "#{namespace}.#{k}" do
      value v
    end
  end
end
