require 'minitest/autorun'
Dir["./models/*.rb"].each {|file| require file }

class TestPassCracker < Minitest::Test

	def setup
		@pass_cracker = PassCracker.new(WordList.new)
	end

	## Test if trying a word increments num_tries

	def test_try_a_word_increments_num_tries
		random_number = rand(10)
		random_number.times {@pass_cracker.try_a_word!}
		num_tries = @pass_cracker.num_tries

		assert num_tries == random_number
	end

	## Test if cracker recognizes a match between guess and target pass

	def test_recognize_successfully_cracked
		guess = 'axel'
		target = Digest::MD5.hexdigest(guess)

		assert @pass_cracker.successfully_cracked?(guess, target)
	end

	## When pass is cracked, tests if terminal output is expected success message
	## Terminal message should include num_tries as 0, and time elapsed as 0.0

	def test_report_success_output_after_successfully_cracked
		guess = 'axel'
		target = Digest::MD5.hexdigest(guess)
		num_tries = @pass_cracker.num_tries
		time_elapsed = @pass_cracker.timer.time_elapsed

		assert_output(/Cracked password in #{num_tries} tries, time elapsed: #{0.0}\nThe password is axel.\n/){@pass_cracker.successfully_cracked?(guess, target)}
	end

	def test_it_can_crack_a_four_letter_string
		# four_letter_strings = ["four", "dawg", "catt", "lark"]
		# target = Digest::MD5.hexdigest(four_letter_strings[rand(4)])

		# assert @pass_racker.crack!(target)
		skip "Test if password cracker crack! returns true given a four-letter string"
	end

	def test_report_still_working_every_ten_tries_by_default
		skip "Test the report is outputted to terminal the number of times specified by user"
	end

end