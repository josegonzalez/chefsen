dmg_package "Sublime Text 2" do
  dmg_name 'Sublime%20Text%202.0.1'
  source node[:sublime_text][:source]
  checksum node[:sublime_text][:checksum]
end

link '/usr/local/bin/subl' do
  to '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'
end

recursive_directories(["#{node[:user_home]}/Library/Application Support", "Sublime Text 2", "Installed Packages"]) do
  owner node[:current_user]
  group node[:current_group]
  recursive true
end

recursive_directories(["#{node[:user_home]}/Library/Application Support", "Sublime Text 2", "Packages", "User"]) do
  owner node[:current_user]
  group node[:current_group]
  recursive true
end

sublime_package_path = "#{node[:user_home]}/Library/Application Support/Sublime Text 2/Packages"

node[:sublime_text][:packages].each do |package|
  git ::File.join(sublime_package_path, package["name"]) do
    repository package["repository"]
    action :sync
  end
end

sublime_user_file_path = File.expand_path("Preferences.sublime-settings", File.join(sublime_package_path, "User"))

template sublime_user_file_path do
  source "sublime_text-Preferences.sublime-settings.erb"
  action :create
  not_if { JSON.parse(File.open(sublime_user_file_path).read) == node[:sublime_text][:settings] }
end

package_dir = "#{node[:user_home]}/Library/Application Support/Sublime Text 2/Installed Packages"
filename    = "Package Control.sublime-package"

remote_file "#{package_dir}/#{filename}" do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  action :create_if_missing
end
