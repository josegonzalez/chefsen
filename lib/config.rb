dna_file = nil
ARGV.each_with_index {|val, index| dna_file = ARGV[index + 1] if val == "-j" }
raise "No dna file specified with the -j flag" if dna_file.nil?

dna = []
File.open(dna_file, 'r').each {|l| dna << l }
dna = JSON.load(dna.join("\n"))

config = dna.fetch('config')
raise "Missing configuration hash in dna" if config.nil?

username = config.fetch("username")
raise "No username set in config" unless username
ENV['CHEF_USERNAME'] = username
