## MD5 Hash Brute Force Cracker

require 'digest/md5'
require 'gentle_brute'

# require all models
Dir["./models/*.rb"].each {|file| require file }

## Try a test hash
# target_hash = Digest::MD5.hexdigest("doge")

## If user doesn't enter an argument, terminate
if ARGV[0].nil?
  puts "syntax: ruby simple_pass_cracker.rb -p <password>"
  puts "syntax: ruby simple_pass_cracker.rb -h <hashed password>"
  exit
end

## If -h flag, hash it, if -p flag, don't and treat as password
if ARGV[0] == "-p"
	target_hash = Digest::MD5.hexdigest(ARGV[1])
elsif ARGV[0] == "-h"
  target_hash = ARGV[1]
end

puts target_hash

word_list = WordList.new

# Pass a custom wordlist into the PassCracker (optional)
password_cracker = PassCracker.new(word_list)

# Crack the hashed password
password_cracker.crack!(target_hash)
