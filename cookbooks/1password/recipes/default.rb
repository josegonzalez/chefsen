utils_compressed_app "1Password.app" do
  checksum node['one_password']['checksum']
  source "http://aws.cachefly.net/dist/1P/mac/1Password-#{node['one_password']['version']}.zip"
end

backup_path = File.expand_path("#{node[:user_home]}/Dropbox/Backups/1Password")
directory(backup_path) { action :create ; recursive true }

keychain_path = File.expand_path( "#{node[:user_home]}/Dropbox/1Password.agilekeychain" )

settings = {
  "AgileKeychainLocation"         => keychain_path,
  "keychainBackupFolderPath"      => backup_path,
  "AGUpdateAllowBetas"            => true,
  "AGInstallBrowserExtensions"    => true,
  "AGAskedAboutBrowserExtensions" => false,
  "keychainRotationFrequency"     => 10,
  "License"                       => {
    "Person" => node[:one_password][:name],
    "Serial" => node[:one_password][:key]
  }
}

settings.each do |k,v|
  mac_os_x_userdefaults k do
    domain "ws.agile.1Password"
    key    k
    value  v
  end
end
