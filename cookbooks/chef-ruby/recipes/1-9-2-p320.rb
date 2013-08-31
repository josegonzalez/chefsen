include_recipe "chef-ruby::init"

chef_ruby_version '1.9.2-p320' do
  cc '/usr/local/bin/gcc-4.2'
end
