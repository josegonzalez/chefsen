actions :install, :uninstall

attribute :installed, :kind_of => [TrueClass, FalseClass]
attribute :default, :kind_of => [TrueClass, FalseClass], :default => true
attribute :cc, :kind_of => String, :default => "/usr/bin/cc"
attribute :configure, :kind_of => String, :default => nil

def initialize( *args )
  super
  @action = :install
end
