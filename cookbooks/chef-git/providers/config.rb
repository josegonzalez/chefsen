action :set do
  $global = new_resource.global
  $global = "--global" if $global
  $global = "" unless $global

  execute "git config #{new_resource.name} #{new_resource.value}" do
    command "git config #{$global} #{new_resource.name} #{new_resource.value}"
    not_if "git config #{$global} #{new_resource.name}|grep #{new_resource.value}"
  end
end
