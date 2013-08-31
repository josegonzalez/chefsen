git node[:rbenv][:root] do
  action :sync
  repository "git://github.com/sstephenson/rbenv.git"
  revision node[:rbenv][:version]
end

[ 'plugins', 'rbenv.d', 'install', 'shims', 'versions'].each do |d|
  directory File.join([node[:rbenv][:root], d]) do
    owner node[:current_user]
    group node[:current_group]
  end
end

# Hack because, on creation, chef does not appear to apply the proper perms to a directory...
[ 'plugins', 'rbenv.d', 'install', 'shims', 'versions'].each do |d|
  directory File.join([node[:rbenv][:root], d]) do
    owner node[:current_user]
    group node[:current_group]
  end
end

has_default_gems_plugin = false
node[:rbenv][:plugins].each do |plugin|
  has_default_gems_plugin = true if plugin[:name] == 'rbenv-default-gems'

  git "#{node[:rbenv][:root]}/plugins/#{plugin[:name]}" do
    action :sync
    repository plugin[:repository]
    revision plugin[:revision]
  end
end

file "#{node[:rbenv][:root]}/default-gems" do
  content node[:rbenv][:gems].join("\n") + "\n"
  only_if { has_default_gems_plugin }
end

template "#{node[:chefsen][:envdir]}/rbenv.sh" do
  source 'rbenv.sh.erb'
  variables({
    :rbenv_root => node[:rbenv][:root]
  })
end
