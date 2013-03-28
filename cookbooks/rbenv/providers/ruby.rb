def load_current_resource
  @ruby = Chef::Resource::RbenvRuby.new(new_resource.name)

  Chef::Log.debug("Checking whether we've already installed #{new_resource.name}")
  if ::File.directory?("rbenv versions|grep #{@ruby.name}")
    @ruby.installed true
  else
    @ruby.installed false
  end
end

action :install do
  unless @ruby.installed
    $ruby_versions = "/Users/#{ENV['CHEF_USERNAME']}/.rbenv/versions"

    $opts = new_resource.configure
    $opts = "CONFIGURE_OPTS='#{$opts}'" unless $opts.nil?
    $opts = '' if $opts.nil?

    execute "ruby-#{new_resource.name}" do
      cwd   $ruby_versions
      command "CC='#{new_resource.cc}' #{$opts} rbenv install #{new_resource.name}"
      not_if "rbenv versions |grep #{new_resource.name}"
    end

    execute "bundler for #{new_resource.name}" do
      cwd   $ruby_versions
      command "#{$ruby_versions}/#{new_resource.name}/bin/gem install bundler"
      not_if "#{$ruby_versions}/#{new_resource.name}/bin/gem list|grep bundler"
    end

    execute "rbenv-autohash for #{new_resource.name}" do
      cwd   $ruby_versions
      command "#{$ruby_versions}/#{new_resource.name}/bin/gem install rbenv-autohash"
      not_if "#{$ruby_versions}/#{new_resource.name}/bin/gem list|grep rbenv-autohash"
    end

    execute "set-default-ruby-to-#{new_resource.name}" do
      cwd   $ruby_versions
      command "rbenv global #{new_resource.name}"
      only_if "rbenv version|grep system"
    end
  end
end

action :uninstall do
  if @ruby.installed
    execute "uninstalling #{new_resource.name}" do
      command "rbenv uninstall #{new_resource.name}"
    end
  end
end
