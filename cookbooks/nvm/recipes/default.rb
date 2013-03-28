$home = node['nvm']['home']
$bash = "#{$home}/.nvm/nvm.sh"

git "#{$home}/.nvm" do
  repository "git://github.com/creationix/nvm.git"
  action :sync
end

execute "install-nvm" do
  cwd   $home

  command <<-EOF
    echo '\n# Add NPMs local bins to the path.' >> #{$home}/.bashrc
    echo '. #{$bash}' >> #{$home}/.bashrc;
    . #{$bash}
  EOF

  notifies :run, "execute[install-nodes]", :immediately
  not_if "grep nvm #{$home}/.bashrc"
end

execute "install-nodes" do
  cwd   $home

  @all_node_versions = Array(node['nvm']['node_versions'])

  command @all_node_versions.map { |v| ". #{$bash} ; nvm install #{v}" }.join("\n").strip

  if node['nvm']['default_node_version'] || @all_node_versions.count > 0
    notifies :run, "execute[make-default-node-version]", :immediately
  end

  action :nothing
end

execute "make-default-node-version" do
  cwd   $home

  @default_node_version = node['nvm']['default_node_version'] || Array(node['nvm']['node_versions']).first
  command ". #{$bash} ; nvm alias default #{@default_node_version}"

  action :nothing
end

execute "set-current-node-version" do
  cwd   $home

  @default_node_version = node['nvm']['default_node_version'] || Array(node['nvm']['node_versions']).first
  command ". #{$bash} ; nvm use #{@default_node_version}"
  not_if ". #{$bash} ; nvm ls | grep current | grep #{@default_node_version}"
end
