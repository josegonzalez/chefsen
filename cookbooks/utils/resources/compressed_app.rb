actions :install

attribute :checksum, :kind_of => String, :default => nil
attribute :source, :kind_of => String, :default => nil
attribute :user, :kind_of => String, :default => nil

def initialize( *args )
  super
  @action = :install
end
