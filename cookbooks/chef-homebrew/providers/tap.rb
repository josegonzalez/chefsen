action :tap do
  tap_dir = new_resource.name.gsub('/', '-')

  unless ::File.directory?("/usr/local/Library/Taps/#{tap_dir}")
    execute "tapping #{new_resource.name}" do
      command "/usr/local/bin/brew tap #{new_resource.name}"
    end
  end
end

action :untap do
  if ::File.directory?("/usr/local/Library/Taps/#{tap_dir}")
    execute "untapping #{new_resource.name}" do
      command "/usr/local/bin/brew untap #{new_resource.name}"
    end
  end
end
