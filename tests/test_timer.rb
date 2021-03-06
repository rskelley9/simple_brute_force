require 'minitest/autorun'
require File.expand_path("../../models/timer", __FILE__)

class TestTimer < Minitest::Test

	def setup
		@timer = Timer.new(:milliseconds)
		@timer.start!
		@timer.stop
	end

	def test_default_times_are_nil
		assert_nil Timer.new.start_time
		assert_nil Timer.new.end_time
	end

	def test_start_time_is_kind_of_time
		assert_kind_of Time, @timer.start_time
	end

	def test_start_time_is_more_recent_than_end_time_when_timer_is_stopped
		assert @timer.start_time < @timer.end_time
	end

	def test_default_timer_returns_time_elapsed_as_float
		assert_kind_of Float, @timer.time_elapsed
	end

	def test_time_elapsed_greater_than_zero_after_stop
		assert @timer.time_elapsed > 0
	end

	def test_times_are_cleared_when_timer_is_reset
		@timer.reset!
		assert_nil @timer.start_time
		assert_nil @timer.end_time
	end

end