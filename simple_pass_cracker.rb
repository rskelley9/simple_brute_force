## MD5 Hash Brute Force Cracker

require 'digest/md5'
require 'gentle_brute'

# require all models
Dir["./models/*.rb"].each {|file| require file }

# Set default password and hash it if user doesn't enter one
if ARGV[0]
  target_hash = Digest::MD5.hexdigest(ARGV[0])
else
  target_hash = Digest::MD5.hexdigest("axel")
end

word_list = WordList.new

# Pass a custom wordlist into the PassCracker (optional)
password_cracker = PassCracker.new(word_list)

# Crack the hashed password
password_cracker.crack!(target_hash)
