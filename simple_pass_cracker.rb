## MD5 Hash Brute Force Cracker

require 'digest/md5'
require 'gentle_brute'

## Example

# Set default password and hash it if user doesn't enter one
if ARGV[0]
  target_hash = Digest::MD5.hexdigest(ARGV[0])
else
  target_hash = Digest::MD5.hexdigest("axel")
end

word_list = GentleBrute::BruteForcer.new

# pass a custom wordlist into the PassCracker (optional)
password_cracker = PassCracker.new(word_list)

# crack the hashed password
password_cracker.crack!(target_hash)


end