actions :install, :uninstall
attribute :name,
  :name_attribute => true,
  :kind_of        => String,
  :regex          => /\Av\d+\.\d+\.\d+\z/

attribute :compile,
  :kind_of => [TrueClass, FalseClass]

attribute :installed,
  :kind_of => [TrueClass, FalseClass]

### hax for default action
def initialize( *args )
  super
  @action = :install
end
