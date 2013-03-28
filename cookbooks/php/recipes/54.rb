homebrew_tap "josegonzalez/php"

# Note that this will fail if another php is linked
package "php54"

node[:php][:extensions].each do |ext|
  package "php54-#{ext}" do
    not_if "brew list php54-#{ext}|grep 'No such keg'"
  end
end
