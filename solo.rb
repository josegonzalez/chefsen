require 'chef-sudo'
require 'json'
require './lib/config'

base_path = File.expand_path('~')

file_cache_path  base_path + '/chef/cache'
cookbook_path    base_path + '/chef/cookbooks'
file_backup_path base_path + '/chef/backup'
log_level        :info
log_location     STDOUT
ssl_verify_mode  :verify_none
verbose_logging  false
