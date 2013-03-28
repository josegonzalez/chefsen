node.default[:user_home] = "/Users/#{ENV['CHEF_USERNAME']}"
node.default[:current_user] = ENV['CHEF_USERNAME']
