base_path = File.join(File.expand_path("~"), ".chefsen")
node.default[:nvm][:home] = "/Users/#{ENV['CHEF_USERNAME']}"
node.default[:nvm][:node_versions] = ['0.4.10', '0.6.20', '0.8.20']
node.default[:nvm][:default_node_version] = 'v0.8.20'
