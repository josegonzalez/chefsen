# Ensure all the required directories exist

[
  :home,
  :bindir,
  :cachedir,
  :configdir,
  :datadir,
  :envdir,
  :homebrewdir,
  :logdir,
  :socketdir,
  :vardir,
].each do |d|
  directory node[:chefsen][d] do
    owner node[:current_user]
    group node[:current_group]
    recursive true
    not_if { File.directory? node[:chefsen][d] }
  end
end

cookbook_file "#{node[:chefsen][:home]}/README.markdown" do
  source "README.markdown"
end

template "#{node[:chefsen][:home]}/env.sh" do
  mode 0755
  source "env.sh.erb"
  variables({
    :chefsen_home => node[:chefsen][:home],
    :envdir => node[:chefsen][:envdir]
  })
end

template "#{node[:chefsen][:envdir]}/config.sh" do
  source "config.sh.erb"
  variables({
    :bindir    => node[:chefsen][:bindir],
    :configdir => node[:chefsen][:configdir],
    :datadir   => node[:chefsen][:datadir],
    :envdir    => node[:chefsen][:envdir],
    :logdir    => node[:chefsen][:logdir],
    :socketdir => node[:chefsen][:socketdir],
    :srcdir    => node[:chefsen][:srcdir],
  })
end

template "#{node[:chefsen][:envdir]}/gh_creds.sh" do
  source 'gh_creds.sh.erb'
end
