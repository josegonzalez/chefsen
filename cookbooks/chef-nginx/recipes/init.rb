include_recipe 'chef-homebrew::init'

service 'nginx' do
  action :nothing
  provider Chef::Provider::Service::Macosx
  supports [:enable, :start, :restart, :stop]
end

# Install our custom plist for nginx. This is one of the very few
# pieces of setup that takes over priv. ports (80 in this case).

template '/Library/LaunchDaemons/homebrew.mxcl.nginx.plist' do
  owner 'root'
  group 'wheel'
  source 'homebrew.mxcl.nginx.plist.erb'
  action :create
  mode 0644
  variables({
    :configfile => node.default[:nginx][:configfile],
    :datadir    => node.default[:nginx][:datadir],
    :executable => node.default[:nginx][:executable],
    :logfile    => node.default[:nginx][:logfile],
  })
  notifies :restart, resources(:service => 'nginx')
end

directory node[:nginx][:configdir]
directory node[:nginx][:datadir]
directory node[:nginx][:logdir]
directory node[:nginx][:sitesdir]

package 'nginx' do
  provider Chef::Provider::Package::Homebrew
  notifies :restart, resources(:service => 'nginx')
  not_if 'brew list|grep nginx'
end

template node[:nginx][:configfile] do
  source 'nginx.conf.erb'
  variables({
    :configdir    => node.default[:nginx][:configdir],
    :current_user => node.default[:current_user],
    :logdir       => node.default[:nginx][:logdir],
    :pidfile      => node.default[:nginx][:pidfile],
    :sitesdir     => node.default[:nginx][:sitesdir],
  })
  notifies :restart, resources(:service => 'nginx')
end

cookbook_file "#{node[:nginx][:configdir]}/mime.types" do
  source 'mime.types'
  action :create_if_missing
  notifies :restart, resources(:service => 'nginx')
end

# Set up a very friendly little default one-page site for when
# people hit http://localhost.

directory "#{node[:nginx][:configdir]}/public"
directory "#{node[:nginx][:configdir]}/public/css"
directory "#{node[:nginx][:configdir]}/public/fonts"
directory "#{node[:nginx][:configdir]}/public/images"

[
  'public/css/bass.css',
  'public/fonts/pictos-web.eot',
  'public/fonts/pictos-web.svg',
  'public/fonts/pictos-web.ttf',
  'public/fonts/pictos-web.woff',
  'public/images/background-tile.png',
  'public/images/puppet.png',
  'public/index.html',
].each do |f|
  cookbook_file "#{node[:nginx][:configdir]}/#{f}" do
    source f
  end
end
