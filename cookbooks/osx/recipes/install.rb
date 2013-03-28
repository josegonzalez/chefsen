node[:osx][:dmg].each do |dmg|
  dmg_package dmg[:name] do
    if dmg[:volumes_dir]
      volumes_dir dmg[:volumes_dir]
    end

    source dmg[:source]
    action :install
  end
end
