git "#{node[:nodenv][:root]}" do
  action :sync
  repository "git://github.com/wfarr/nodenv.git"
  revision node[:nodenv][:version]
end

directory "#{node[:nodenv][:root]}/versions"

template "#{node[:chefsen][:envdir]}/nodenv.sh" do
  source 'nodenv.sh.erb'
  variables({
    :nodenv_root => node[:nodenv][:root]
  })
end
