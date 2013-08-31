include_recipe "chefsen::config"

template "#{node[:user_home]}/.bashrc" do
  mode 0644
  source "bashrc.erb"
  action :create_if_missing
end

template "#{node[:user_home]}/.bash_profile" do
  mode 0644
  source "bash_profile.erb"
  action :create_if_missing
end

execute "create a minimal profile" do
  cwd   node[:user_home]

  command <<-EOF
    echo 'source #{node[:chefsen][:home]}/env.sh' >> #{node[:user_home]}/.bashrc
  EOF

  not_if "grep env.sh #{node[:user_home]}/.bashrc"
end
