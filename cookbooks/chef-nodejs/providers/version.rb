action :install do
  unless ::File.directory?("#{node[:nodenv][:root]}/versions/#{new_resource.name}")
    cmd = [
      "#{node[:nodenv][:root]}/bin/nodenv",
      "install",
      "#{new_resource.name}"
    ]
    cmd << "--source" if new_resource.compile

    execute "installing #{new_resource.name}" do
      command cmd
      environment ({"NODENV_ROOT" => node[:nodenv][:root]})
    end
  end
end

action :uninstall do
  if ::File.directory?("#{node[:nodenv][:root]}/versions/#{new_resource.name}")
    cmd = [
      "#{node[:nodenv][:root]}/bin/nodenv",
      "uninstall",
      "#{new_resource.name}"
    ]

    execute "uninstalling #{new_resource.name}" do
      command cmd
      environment ({"NODENV_ROOT" => node[:nodenv][:root]})
    end
  end
end
