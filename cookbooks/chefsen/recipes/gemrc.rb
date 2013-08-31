include_recipe "chefsen::config"

cookbook_file "#{node[:user_home]}/gemrc" do
  source "gemrc"
end
