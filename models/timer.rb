class Timer

  attr_reader :start_time, :end_time, :interval

  @@timescales = {milliseconds: 1000.0, seconds: 1.0, minutes: 1.0/60.0}

  def initialize(interval=:milliseconds)
    @start_time = nil
    @end_time = nil
    @interval = @@timescales[interval.to_sym]
  end

  def start!
    puts "restarted timer" if @start_time

    @start_time = Time.now
    @end_time = nil
  end

  def stop
    @end_time ||= Time.now
  end

  def reset!
    @start_time = nil
    @end_time = nil
  end

  def time_elapsed
    return (0 * @interval) if @start_time.nil?

    (@end_time - @start_time) * @interval
  end


end