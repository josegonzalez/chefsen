utils_compressed_app "GitX.app" do
  source node[:gitx][:default_source]
end

link '/usr/local/bin/gitx' do
  to '/Applications/GitX.app/Contents/Resources/gitx'
end
