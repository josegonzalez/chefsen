include_attribute "chefsen::default"

node.default[:nginx][:configdir]  = "#{node[:chefsen][:configdir]}/nginx"
node.default[:nginx][:configfile] = "#{node[:nginx][:configdir]}/nginx.conf"
node.default[:nginx][:datadir]    = "#{node[:chefsen][:datadir]}/nginx"
node.default[:nginx][:executable] = "#{node[:chefsen][:homebrewdir]}/opt/nginx/bin/nginx"
node.default[:nginx][:logdir]     = "#{node[:chefsen][:logdir]}/nginx"
node.default[:nginx][:logfile]    = "#{node[:chefsen][:logdir]}/nginx/console.log"
node.default[:nginx][:pidfile]    = "#{node[:nginx][:datadir]}/nginx.pid"
node.default[:nginx][:sitesdir]   = "#{node[:nginx][:configdir]}/sites"
