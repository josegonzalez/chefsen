homebrew_go = "#{Chef::Config[:file_cache_path]}/homebrew_go"

remote_file homebrew_go do
  source 'https://raw.github.com/mxcl/homebrew/go'
  mode 00755
  checksum 'b0233220dcecb8ef2349a8c67bc5bd330dbf9d89'
  not_if { File.exist? homebrew_go }  # TODO: Fix this
end

execute homebrew_go do
  not_if { File.exist? '/usr/local/bin/brew' }
end

execute 'update homebrew from github' do
  command '/usr/local/bin/brew update || true'
end
