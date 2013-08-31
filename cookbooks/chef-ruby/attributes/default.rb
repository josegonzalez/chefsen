include_attribute "chefsen::default"

node.default[:rbenv][:root] = '/usr/local/share/rbenv'
node.default[:rbenv][:version] = '060f141b2174f9ab53b7c2c248ad8f426ec5c125' # v0.3.3
node.default[:rbenv][:user] = node[:current_user]
node.default[:rbenv][:gems] = []
node.default[:rbenv][:plugins] = [
  {
    :name => 'ruby-build',
    :revision => 'v20130514',
    :repository => 'git://github.com/sstephenson/ruby-build.git',
  },
  {
    :name => 'rbenv-gem-rehash',
    :revision => 'v1.0.0',
    :repository => 'git://github.com/sstephenson/rbenv-gem-rehash.git',
  },
  {
    :name => 'rbenv-default-gems',
    :revision => 'v1.0.0',
    :repository => 'git://github.com/sstephenson/rbenv-default-gems.git',
  }
]