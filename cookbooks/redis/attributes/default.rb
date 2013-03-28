node.default[:redis][:configdir] = "/usr/local/var/lib/redis"
node.default[:redis][:logdir] = "/usr/local/var/log/"
node.default[:redis][:configfile] = "/usr/local/etc/redis.conf"
node.default[:redis][:workingdir] = "/usr/local/var"
node.default[:redis][:stderrlog] = "/usr/local/var/log/redis.log"
node.default[:redis][:stdoutlog] = "/usr/local/var/log/redis.log"


node.default[:redis][:daemonize] = "no"
node.default[:redis][:pidfile] = "/usr/local/var/run/redis.pid"
node.default[:redis][:port] = 6379
node.default[:redis][:bind] = "127.0.0.1"
node.default[:redis][:unixsocket] = nil
node.default[:redis][:unixsocketperm] = nil
node.default[:redis][:timeout] = 0
node.default[:redis][:tcp_keepalive] = 0
node.default[:redis][:loglevel] = "notice"
node.default[:redis][:logfile] = "stdout"
node.default[:redis][:syslog_enabled] = "no"
node.default[:redis][:syslog_ident] = nil
node.default[:redis][:syslog_facility] = nil
node.default[:redis][:databases] = 16

# SNAPSHOTTING
node.default[:redis][:save]['900'] = 1
node.default[:redis][:save]['300'] = 10
node.default[:redis][:save]['60'] = 10000
node.default[:redis][:stop_writes_on_bgsave_error] = "yes"
node.default[:redis][:rdbcompression] = "yes"
node.default[:redis][:rdbchecksum] = "yes"
node.default[:redis][:dbfilename] = "dump.rdb"
node.default[:redis][:dir] = "/usr/local/var/db/redis/"

# REPLICATION
node.default[:redis][:slaveof] = nil
node.default[:redis][:masterauth] = nil
node.default[:redis][:slave_serve_stale_data] = "yes"
node.default[:redis][:slave_read_only] = "yes"
node.default[:redis][:repl_ping_slave_period] = nil
node.default[:redis][:repl_timeout] = nil
node.default[:redis][:repl_disable_tcp_nodelay] = "no"
node.default[:redis][:slave_priority] = 100

# SECURITY
node.default[:redis][:requirepass] = nil
node.default[:redis][:rename_command] = {}

# LIMITS
node.default[:redis][:maxclients] = nil
node.default[:redis][:maxmemory] = nil
node.default[:redis][:maxmemory_policy] = nil
node.default[:redis][:maxmemory_samples] = nil

# APPEND ONLY MODE
node.default[:redis][:appendonly] = "no"
node.default[:redis][:appendfilename] = "appendonly.aof"
node.default[:redis][:appendfsync] = "everysec"
node.default[:redis][:no_appendfsync_on_rewrite] = "no"
node.default[:redis][:auto_aof_rewrite_percentage] = 100
node.default[:redis][:auto_aof_rewrite_min_size] = "64mb"

# LUA SCRIPTING
node.default[:redis][:lua_time_limit] = 5000

# SLOW LOG
node.default[:redis][:slowlog_log_slower_than] = 10000
node.default[:redis][:slowlog_max_len] = 128

# ADVANCED CONFIG
node.default[:redis][:hash_max_ziplist_entries] = 512
node.default[:redis][:hash_max_ziplist_value] = 64
node.default[:redis][:list_max_ziplist_entries] = 512
node.default[:redis][:list_max_ziplist_value] = 64
node.default[:redis][:set_max_intset_entries] = 512
node.default[:redis][:zset_max_ziplist_entries] = 128
node.default[:redis][:zset_max_ziplist_value] = 64
node.default[:redis][:activerehashing] = "yes"
node.default[:redis][:client_output_buffer_limit][:normal] = "0 0 0"
node.default[:redis][:client_output_buffer_limit][:slave] = "256mb 64mb 60"
node.default[:redis][:client_output_buffer_limit][:pubsub] = "32mb 8mb 60"
node.default[:redis][:hz] = 10

# INCLUDES
node.default[:redis][:include] = []
