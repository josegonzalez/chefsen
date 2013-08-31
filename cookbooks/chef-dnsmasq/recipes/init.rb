include_recipe 'chef-homebrew::init'

service 'dnsmasq' do
  action :nothing
  provider Chef::Provider::Service::Macosx
  supports [:enable, :start, :restart, :stop]
end

directory node[:dnsmasq][:configdir]
directory node[:dnsmasq][:datadir]

template node[:dnsmasq][:configfile] do
  source 'dnsmasq.conf.erb'
  action :create_if_missing
  notifies :restart, resources(:service => 'dnsmasq')
end

template '/Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist' do
  owner 'root'
  group 'wheel'
  source 'homebrew.mxcl.dnsmasq.plist.erb'
  action :create
  mode 0644
  notifies :restart, resources(:service => 'dnsmasq')
end

directory '/etc/resolver' do
  owner 'root'
  group 'wheel'
  action :create
end

file '/etc/resolver/dev' do
  owner 'root'
  group 'wheel'
  content 'nameserver 127.0.0.1'
  action :create_if_missing
  notifies :restart, resources(:service => 'dnsmasq')
end

package 'dnsmasq' do
  provider Chef::Provider::Package::Homebrew
  notifies :restart, resources(:service => 'dnsmasq')
  not_if 'brew list|grep dnsmasq'
end
