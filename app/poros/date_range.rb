class DateRange
  def self.current_week
    starting_date...ending_date
  end

  def self.starting_date
    Date.today.beginning_of_week(:sunday).beginning_of_day
  end

  def self.ending_date
    Date.today.end_of_week(:sunday).end_of_day
  end
end
