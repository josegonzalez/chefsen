base_path = File.join(File.expand_path("~"), ".chefsen")
node.default[:dnsmasq][:configdir] = File.join(base_path, "config", "dnsmasq")
node.default[:dnsmasq][:configfile] = File.join(base_path, "config", "dnsmasq", "dnsmasq.conf")
node.default[:dnsmasq][:datadir] = File.join(base_path, "data", "dnsmasq")
node.default[:dnsmasq][:executable] = "/usr/local/sbin/dnsmasq"
node.default[:dnsmasq][:logdir] = File.join(base_path, "log", "dnsmasq")
node.default[:dnsmasq][:logfile] = File.join(base_path, "log", "dnsmasq", "console.log")
