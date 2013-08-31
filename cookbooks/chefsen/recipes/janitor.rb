['bin/cc', 'bin/gcc'].each do |f|
  file "#{node[:chefsen][:homebrewdir]}/#{f}" do
    action :delete
  end
end
