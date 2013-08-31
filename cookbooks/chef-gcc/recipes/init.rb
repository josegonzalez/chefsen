include_recipe 'chef-homebrew::init'

chef_homebrew_tap 'homebrew/dupes'

package 'apple-gcc42' do
  provider Chef::Provider::Package::Homebrew
  not_if 'brew list|grep apple-gcc42'
end
