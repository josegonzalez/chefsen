action :install do
  unless ::File.directory?("#{node[:rbenv][:root]}/bin/rbenv versions|grep #{new_resource.name}")

    $opts = new_resource.configure
    $opts = "CONFIGURE_OPTS='#{$opts}'" unless $opts.nil?
    $opts = '' if $opts.nil?
    $version_directory = "#{node[:rbenv][:root]}/versions/#{new_resource.name}"

    execute "ruby-#{new_resource.name}" do
      cwd node[:rbenv][:root]
      command "RBENV_ROOT='#{node[:rbenv][:root]}' CC='#{new_resource.cc}' #{$opts} #{node[:rbenv][:root]}/bin/rbenv install #{new_resource.name}"
      not_if "RBENV_ROOT='#{node[:rbenv][:root]}' #{node[:rbenv][:root]}/bin/rbenv versions |grep #{new_resource.name}"
    end

    execute "bundler for #{new_resource.name}" do
      retries 2
      cwd node[:rbenv][:root]
      command "RBENV_ROOT='#{node[:rbenv][:root]}' #{$version_directory}/bin/gem install bundler --no-ri --no-rdoc"
      not_if "RBENV_ROOT='#{node[:rbenv][:root]}' #{$version_directory}/bin/gem list|grep bundler"
    end

    execute "rbenv-autohash for #{new_resource.name}" do
      cwd node[:rbenv][:root]
      command "RBENV_ROOT='#{node[:rbenv][:root]}' #{$version_directory}/bin/gem install rbenv-autohash --no-ri --no-rdoc"
      not_if "RBENV_ROOT='#{node[:rbenv][:root]}' #{$version_directory}/bin/gem list|grep rbenv-autohash"
    end

    if new_resource.default
      execute "set-default-ruby-to-#{new_resource.name}" do
        cwd node[:rbenv][:root]
        command "RBENV_ROOT='#{node[:rbenv][:root]}' #{node[:rbenv][:root]}/bin/rbenv global #{new_resource.name}"
        only_if "RBENV_ROOT='#{node[:rbenv][:root]}' #{node[:rbenv][:root]}/bin/rbenv version|grep system"
      end
    end
  end
end

action :uninstall do
  if ::File.directory?("#{node[:rbenv][:root]}/bin/rbenv versions|grep #{new_resource.name}")
    execute "uninstalling #{new_resource.name}" do
      command "RBENV_ROOT=#{node[:rbenv][:root]} rbenv uninstall #{new_resource.name}"
      only_if "RBENV_ROOT='#{node[:rbenv][:root]}' #{node[:rbenv][:root]}/bin/rbenv versions |grep #{new_resource.name}"
    end
  end
end
