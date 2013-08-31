_username = ENV.fetch('SUDO_USER', ENV.fetch('USER', nil))
raise 'You should not run as root' if _username == 'root'
raise 'Invalid user running this command' if _username.nil?

ENV['CHEF_USERNAME'] = _username
ENV['CHEF_GROUP'] = 'staff'

ENV['HOMEBREW_PREFIX'] = '/usr/local'
