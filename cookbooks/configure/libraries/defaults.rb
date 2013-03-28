require 'chef/resource/directory'
require 'chef/resource/execute'
require 'chef/resource/file'
require 'chef/resource/git'
require 'chef/resource/link'
require 'chef/resource/remote_file'
require 'chef/resource/template'

class Chef
  class Resource
    class Directory < Chef::Resource
      alias_method :initialize_directory, :initialize
      def initialize(name, run_context=nil)
        initialize_directory(name, run_context)
        @owner = ENV['CHEF_USERNAME']
        @group = 'staff'
      end
    end
  end
end

class Chef
  class Resource
    class Execute < Chef::Resource
      alias_method :initialize_execute, :initialize
      def initialize(name, run_context=nil)
        initialize_execute(name, run_context)
        @user = ENV['CHEF_USERNAME']
        @group = 'staff'
      end
    end
  end
end

class Chef
  class Resource
    class File < Chef::Resource
      alias_method :initialize_file, :initialize
      def initialize(name, run_context=nil)
        initialize_file(name, run_context)
        @owner = ENV['CHEF_USERNAME']
        @group = 'staff'
      end
    end
  end
end

class Chef
  class Resource
    class Git < Chef::Resource::Scm
      alias_method :initialize_git, :initialize
      def initialize(name, run_context=nil)
        initialize_git(name, run_context)
        @user = ENV['CHEF_USERNAME']
        @group = 'staff'
      end
    end
  end
end

class Chef
  class Resource
    class Link < Chef::Resource
      alias_method :initialize_link, :initialize
      def initialize(name, run_context=nil)
        initialize_link(name, run_context)
        @owner = ENV['CHEF_USERNAME']
        @group = 'staff'
      end
    end
  end
end

class Chef
  class Resource
    class RemoteFile < Chef::Resource::File
      alias_method :initialize_remote_file, :initialize
      def initialize(name, run_context=nil)
        initialize_remote_file(name, run_context)
        @owner = ENV['CHEF_USERNAME']
        @group = 'staff'
      end
    end
  end
end

class Chef
  class Resource
    class Template < Chef::Resource::File
      alias_method :initialize_template, :initialize
      def initialize(name, run_context=nil)
        initialize_template(name, run_context)
        @owner = ENV['CHEF_USERNAME']
        @group = 'staff'
      end
    end
  end
end
