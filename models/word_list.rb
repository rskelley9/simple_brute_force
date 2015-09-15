require 'digest/md5'
require 'gentle_brute'

class WordList

  def initialize
    @words = GentleBrute::BruteForcer.new
  end

  def self.hash_this_(phrase)
    Digest::MD5.hexdigest(phrase)
  end

  def words
    @words
  end

  def return_phrase
    @words.next_valid_phrase
  end

  def regenerate!
    @words = GentleBrute::BruteForcer.new
  end

end