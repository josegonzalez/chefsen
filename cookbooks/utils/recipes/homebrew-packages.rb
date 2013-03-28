node[:homebrew][:packages].each do |p|
  package p do
    not_if "brew list #{p}|grep 'No such keg'"
  end
end
