require 'digest/md5'
require 'gentle_brute'

class PassCracker
  def initialize(wordlist=WordList.new, report_every=10)
  self.num_tries = 0
  self.wordlist = wordlist
  self.report_every = report_every
  end

  def crack!(target_word)
    target_hash = Digest::MD5.hexdigest(target_word)

    while true
      ## Pending message every 10 tries
      self.try_a_word
      self.report_results

      ## Use a word from word list to test
      phrase = word_list.next_valid_phrase
      ## Hash that word to compare to password hash
      attempt_hash = Digest::MD5.hexdigest(phrase)

      ## If the hashes match, print the unhashed phrase (password)
      if attempt_hash == target_hash
        puts "Cracked!"
        puts "Password is #{phrase}"
      end

      break if attempt_hash == target_hash
      puts "Tried #{phrase}, not a match. Still trying to crack..."

    end

  end

  def reset!
    self.num_tries = 0
    self.wordlist =  WordList.new
  end

  def try_a_word
    self.num_tries += 1
  end

  def set_auto_report_interval! number
    self.autoreport_interval=number
  end

  def report_results
    puts message if (self.num_tries % self.report_every).eql? 0
  end



end