node.default[:mysql][:port] = 3306
node.default[:mysql][:socket] = "/usr/local/var/mysql/sock"
node.default[:mysql][:logerror] = "/usr/local/var/log/mysql/error.log"
node.default[:mysql][:max_allowed_packet] = 1073741824
node.default[:mysql][:configdir] = "/usr/local/opt/mysql"
node.default[:mysql][:workingdir] = "/usr/local/var"
node.default[:mysql][:datadir] = "/usr/local/var/mysql"
node.default[:mysql][:logdir] = "/usr/local/var/log/mysql"
node.default[:mysql][:configfile] = "/usr/local/opt/mysql/my.cnf"
