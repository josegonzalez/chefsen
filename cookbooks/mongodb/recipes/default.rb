service "mongodb" do
  action :restart
  provider Chef::Provider::Service::Macosx
  supports [:enable, :start, :restart, :stop]
end

[ node[:mongodb][:dbpath] , node[:mongodb][:logdir] ].each do |dir|
  recursive_directories [ dir ] do
    owner node[:current_user]
    group node[:current_group]
    recursive true
  end
end

template '/Library/LaunchDaemons/homebrew.mxcl.mongodb.plist' do
  action :create
  group 'wheel'
  notifies :restart, resources(:service => "mongodb")
  mode 0644
  source 'homebrew.mxcl.mongodb.plist.erb'
  variables(node[:mongodb])
end

template node[:mongodb][:configfile] do
  group 'wheel'
  notifies :restart, resources(:service => "mongodb")
  source 'mongod.conf.erb'
  variables(node[:mongodb])
end

# file { "${boxen::config::envdir}/mongodb.sh":
#   content => template('mongodb/env.sh.erb')
# }

package 'mongodb' do
  notifies :restart, resources(:service => "mongodb")
  provider Chef::Provider::Package::Homebrew
end
