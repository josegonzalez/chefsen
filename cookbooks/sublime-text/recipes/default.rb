dmg_package "Sublime Text 2" do
  dmg_name 'Sublime%20Text%202.0.1'
  source node[:sublime_text][:source]
  checksum node[:sublime_text][:checksum]
end

link '/usr/local/bin/subl' do
  to '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'
end

sublime_package_path = ["#{node[:user_home]}/Library/Application Support/Sublime Text 2", "Packages"]
sublime_user_path = sublime_package_path.dup << "User"

recursive_directories sublime_user_path

node[:sublime_text][:packages].each do |package|
  sublime_text_package package["name"] do
    source package["source"]
    destination File.join(sublime_package_path)
  end
end

template File.expand_path("Preferences.sublime-settings", File.join(sublime_user_path)) do
  source "sublime_text-Preferences.sublime-settings.erb"
  action :create
end

package_dir = "#{node[:user_home]}/Library/Application Support/Sublime Text 2/Installed Packages"
filename    = "Package Control.sublime-package"

recursive_directories(["#{node[:user_home]}/Library/Application Support", "Sublime Text 2", "Installed Packages"])

remote_file "#{package_dir}/#{filename}" do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  :create_if_missing
end
