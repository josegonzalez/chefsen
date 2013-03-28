include_recipe "rbenv::default"

rbenv_ruby '1.8.7-p358' do
  cc '/usr/local/bin/gcc-4.2'
  configure (node.platform_version =~ /^10\.8/ ? '--disable-tk --disable-tcl --disable-tcltk-framework' : nil)
end
