service "dnsmasq" do
  provider Chef::Provider::Service::Macosx
  supports [:enable, :start, :restart, :stop]
end

[ node[:dnsmasq][:configdir], node[:dnsmasq][:logdir] ].each do |dir|
  recursive_directories [ dir ] do
    owner node[:current_user]
    recursive true
  end
end

template node[:dnsmasq][:configfile] do
  source 'dnsmasq.conf.erb'
  action :create
  notifies :restart, resources(:service => "dnsmasq")
end

template '/Library/LaunchDaemons/dev.dnsmasq.plist' do
  owner 'root'
  group 'wheel'
  source 'dev.dnsmasq.plist.erb'
  action :create
  mode 0644
  notifies :restart, resources(:service => "dnsmasq")
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
  notifies :restart, resources(:service => "dnsmasq")
end

package 'dnsmasq' do
  provider Chef::Provider::Package::Homebrew
end

service "dnsmasq" do
  action :start
  provider Chef::Provider::Service::Macosx
  supports [:enable, :start, :restart, :stop]
end
