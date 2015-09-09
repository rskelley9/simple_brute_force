require 'digest/md5'
require 'gentle_brute'

class WordList

  def initialize
    self.wordlist = GentleBrute::BruteForcer.new
  end

  def self.hash_this_(phrase)
    Digest::MD5.hexdigest(phrase)
  end

  def wordlist
    self.wordlist
  end

  def return_phrase
    self.word_list.next_valid_phrase
  end

  def regenerate!
    self.wordlist = GentleBrute::BruteForcer.new
  end

end