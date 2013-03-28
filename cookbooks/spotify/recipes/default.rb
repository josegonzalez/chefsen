utils_compressed_app "Spotify.app" do
  source node[:spotify][:source]
end

execute "install spotify" do
  command "/usr/bin/open '/Applications/Install Spotify.app'"
  cwd "/Applications"
  not_if { ::File.directory?("/Applications/Spotify.app") }
end

execute "remove spotify installer" do
  command "rm '/Applications/Install Spotify.app'"
  cwd "/Applications"
  only_if { ::File.directory?("/Applications/Install Spotify.app") }
end
