node.default[:mongodb][:configfile] = "/usr/local/etc/mongod.conf"
node.default[:mongodb][:logdir] = "/usr/local/var/log/mongodb"
node.default[:mongodb][:dbpath] = "/usr/local/var/mongodb"
node.default[:mongodb][:logpath] = "/usr/local/var/log/mongodb/mongo.log"
node.default[:mongodb][:logappend] = "true"
node.default[:mongodb][:bind_ip] = "127.0.0.1"
node.default[:mongodb][:hard_filesopen] = 1024
node.default[:mongodb][:soft_filesopen] = 1024
