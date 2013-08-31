include_recipe 'chef-homebrew::init'

package 'hub' do
  provider Chef::Provider::Package::Homebrew
  not_if 'brew list|grep hub'
end

chef_git_config 'hub.protocol' do
  value 'https'
end

cookbook_file "#{node[:chefsen][:envdir]}/hub.sh" do
  source 'hub.sh'
end
