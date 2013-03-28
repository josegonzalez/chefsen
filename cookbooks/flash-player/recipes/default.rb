# TODO: Fix me

dmg_package "Flashplayer" do
  app "Install Adobe Flash Player"
  volumes_dir "Flash Player"
  source node[:flash_player][:source]
  action :install
  type "install"
end
