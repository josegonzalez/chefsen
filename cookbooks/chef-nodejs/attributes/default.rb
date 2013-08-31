include_attribute "chefsen::default"

node.default[:nodenv][:root] = '/usr/local/share/nodenv'
node.default[:nodenv][:version] = 'aed3805e40c8e29b3cd75b52e11bc566106e2229' # v0.3.3
node.default[:nodenv][:user] = node[:current_user]