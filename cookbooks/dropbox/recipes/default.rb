dmg_package "Dropbox" do
  volumes_dir "Dropbox Installer"
  source node[:dropbox][:source]
  action :install
end

if node[:dropbox][:exit_if_not_configured]
  ruby_block 'exit_if_dropbox_not_configured' do
    block do
      raise "\n\nYou should run Dropbox and configure it before proceeding. Run chef again when done\n\n"
    end
    not_if { File.exists?(File.expand_path("~/.dropbox")) }
  end
end
