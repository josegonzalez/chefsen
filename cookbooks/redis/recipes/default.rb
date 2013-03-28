service "redis" do
  action :nothing
  provider Chef::Provider::Service::Macosx
  supports [:enable, :start, :restart, :stop]
end

[ node[:redis][:configdir], node[:redis][:dir] , node[:redis][:logdir] ].each do |dir|
  recursive_directories [ dir ] do
    owner node[:current_user]
    recursive true
  end
end

template '/Library/LaunchDaemons/homebrew.mxcl.redis.plist' do
  action :create
  group 'wheel'
  notifies :restart, resources(:service => "redis")
  mode 0644
  source 'homebrew.mxcl.redis.plist.erb'
  variables(node[:redis])
end

template node[:redis][:configfile] do
  group 'wheel'
  notifies :restart, resources(:service => "redis")
  source 'redis.conf.erb'
  variables(node[:redis])
end

# file { "${boxen::config::envdir}/redis.sh":
#   content => template('redis/env.sh.erb')
# }

package 'redis' do
  notifies :restart, resources(:service => "redis")
  provider Chef::Provider::Package::Homebrew
end
