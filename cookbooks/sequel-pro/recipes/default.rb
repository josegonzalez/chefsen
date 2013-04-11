dmg_package "Sequel Pro" do
  volumes_dir "Sequel Pro 1.0.1"
  dmg_name 'sequel-pro-1.0.1'
  source node[:sequel_pro][:source]
  checksum node[:sequel_pro][:checksum]
end
