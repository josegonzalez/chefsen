service "mysql" do
  action :nothing
  provider Chef::Provider::Service::Macosx
  supports [:enable, :start, :restart, :stop]
end

[ node[:mysql][:configdir], node[:mysql][:datadir] , node[:mysql][:logdir] ].each do |dir|
  recursive_directories [ dir ] do
    owner node[:current_user]
    recursive true
  end
end

template '/Library/LaunchDaemons/homebrew.mxcl.mysql.plist' do
  action :create
  group 'wheel'
  notifies :restart, resources(:service => "mysql")
  mode 0644
  source 'homebrew.mxcl.mysql.plist.erb'
  variables(node[:mysql])
end

template node[:mysql][:configfile] do
  group 'wheel'
  notifies :restart, resources(:service => "mysql")
  source 'my.cnf.erb'
  variables(node[:mysql])
end

# file { "${boxen::config::envdir}/mysql.sh":
#   content => template('mysql/env.sh.erb')
# }

package 'mysql' do
  notifies :restart, resources(:service => "mysql")
  provider Chef::Provider::Package::Homebrew
end

execute 'init-mysql-db' do
  command "mysql_install_db \
      --verbose \
      --basedir=#{ENV['HOMEBREW_PREFIX']} \
      --datadir=#{node[:mysql][:datadir]} \
      --tmpdir=/tmp"
  creates "#{node[:mysql][:datadir]}/mysql"
  notifies :restart, resources(:service => "mysql")
end

service "mysql" do
  action :start
  provider Chef::Provider::Service::Macosx
end

nc = "/usr/bin/nc -z localhost #{node[:mysql][:port]}"

execute 'wait-for-mysql' do
  command "while ! #{nc}; do sleep 1; done"
  timeout 30
end
