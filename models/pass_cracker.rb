require 'digest/md5'
require 'gentle_brute'

class PassCracker

  def initialize(wordlist=WordList.new, report_every=10)
    @num_tries = 0
    @word_list = wordlist
    @report_every = report_every
  end

  def crack!(target_hash)


    while true
      ## Pending message every 10 tries
      self.try_a_word
      self.report_still_working

      ## Use a word from word list to test
      phrase = @word_list.return_phrase

      ## If the hashes match, print the unhashed phrase (password)
      break if self.successfully_cracked?(phrase, target_hash)

      # After each loop, report progress
      self.report_not_cracked(phrase)
    end

  end

  def reset!
    @num_tries = 0
    @word_list =  WordList.new
  end

  def successfully_cracked?(phrase, target_hash)

    ## Hash that word to compare to password hash
    attempt_hash = WordList.hash_this_ phrase

    if self.cracked?(attempt_hash, target_hash)
      puts "Cracked password in #{num_tries}"
      puts "The password is #{phrase}"
      true
    else
      false
    end
  end

  def try_a_word
    @num_tries += 1
  end

  def set_auto_report_interval! number
    self.autoreport_interval=number
  end

  def cracked?(guess, target)
    guess == target
  end

  def report_still_working
    message = "#{@num_tries} attempts to crack password, no luck..."
    puts message if (@num_tries % @report_every).eql? 0
  end

  def report_not_cracked(phrase)
    puts "Try no. #{@num_tries} | #{phrase} | NO MATCH"
  end

end