class Timer < ActiveRecord::Base
  def self.first_active
    where(Timer.arel_table[:end_date].gt(Time.now)).order(end_date: :desc).first
  end

  def calculate_end_date(hours:, minutes:)
    time = Time.now
    time += hours.to_i.hours
    time += minutes.to_i.minutes

    self.end_date = time
  end
end
