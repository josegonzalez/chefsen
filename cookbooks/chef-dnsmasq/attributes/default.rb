include_attribute "chefsen::default"

node.default[:dnsmasq][:configdir]  = node[:chefsen][:configdir]
node.default[:dnsmasq][:configfile] = "#{node[:chefsen][:configdir]}/dnsmasq.conf"
node.default[:dnsmasq][:datadir]    = "#{node[:chefsen][:datadir]}/dnsmasq"
node.default[:dnsmasq][:executable] = "/usr/local/opt/dnsmasq/sbin/dnsmasq"
node.default[:dnsmasq][:logdir]     = "#{node[:chefsen][:logdir]}/dnsmasq"
node.default[:dnsmasq][:logfile]    = "#{node[:dnsmasq][:logdir]}/console.log"
