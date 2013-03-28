$home = "/Users/#{ENV['CHEF_USERNAME']}"

package 'hub' do
  not_if 'brew list|grep hub'
end

git_config 'hub.protocol' do
  value 'https'
end

execute 'bashrc-hub' do
  cwd   $home

  command <<-EOF
    echo '\n# Make all the fancy \`hub\` shortcuts available via \`git\`.' >> #{$home}/.bashrc
    echo 'eval "$(hub alias -s)"' >> #{$home}/.bashrc
  EOF

  not_if "grep hub #{$home}/.bashrc"
end
