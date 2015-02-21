class War < ActiveRecord::Base
  belongs_to :opposing_clan, class_name: 'Clan'

  def calculate_start_date(war_status:, hours:, minutes:)
    end_time = Time.now
    end_time += hours.to_i.hours
    end_time += minutes.to_i.minutes
    end_time += 1.day if war_status == 'preparation-day'

    self.start_date = end_time - 2.days
  end
end
