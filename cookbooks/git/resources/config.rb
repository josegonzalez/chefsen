actions :set

attribute :value, :kind_of => String, :default => nil
attribute :global, :kind_of => [TrueClass, FalseClass], :default => true

def initialize( *args )
  super
  @action = :set
end
