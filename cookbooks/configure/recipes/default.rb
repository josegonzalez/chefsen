$home = "/Users/#{ENV['CHEF_USERNAME']}"

template "#{$home}/.bashrc" do
  mode 0644
  source "bashrc.erb"
  action :create_if_missing
end

template "#{$home}/.bash_profile" do
  mode 0644
  source "bash_profile.erb"
  action :create_if_missing
end
