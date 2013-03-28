include_recipe "rbenv::default"

rbenv_ruby '1.9.2-p320' do
  cc '/usr/local/bin/gcc-4.2'
end
