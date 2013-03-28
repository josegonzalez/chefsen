action :install do
  git ::File.expand_path(new_resource.name, new_resource.destination) do
    repository new_resource.source
    group new_resource.group
    user new_resource.owner
    action :sync
  end
end