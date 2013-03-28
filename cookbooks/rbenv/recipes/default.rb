package 'rbenv' do
  not_if 'brew list|grep rbenv'
end

package 'ruby-build' do
  not_if 'brew list|grep ruby-build'
end

execute "bashrc-rbenv" do
  cwd   $home

  command <<-EOF
    echo '\n# Configure and activate rbenv. You know, for rubies.' >> #{$home}/.bashrc
    echo 'eval "$(rbenv init -)"' >> #{$home}/.bashrc
  EOF

  not_if "grep rbenv #{$home}/.bashrc"
end
