action :install do
  $user = new_resource.user || node[:current_user]
  remote_file "#{Chef::Config[:file_cache_path]}/#{new_resource.name}.zip" do
    checksum new_resource.checksum
    source new_resource.source
    not_if { ::File.directory?("/Applications/#{new_resource.name}") }
  end

  execute "set proper permissions on #{new_resource.name}.zip" do
    command "sudo chown #{$user}:staff #{Chef::Config[:file_cache_path]}/#{new_resource.name}.zip"
    cwd "/Applications"
    not_if { ::File.directory?("/Applications/#{new_resource.name}") }
  end

  execute "unzip #{new_resource.name}.zip" do
    command "unzip -qq #{Chef::Config[:file_cache_path]}/#{new_resource.name}.zip"
    cwd "/Applications"
    not_if { ::File.directory?("/Applications/#{new_resource.name}") }
  end

end
