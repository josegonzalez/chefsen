homebrew_tap "josegonzalez/php"

# Note that this will fail if another php is linked
package "php53"

node[:php][:extensions].each do |ext|
  package "php53-#{ext}" do
    not_if "brew list php53-#{ext}|grep 'No such keg'"
  end
end
