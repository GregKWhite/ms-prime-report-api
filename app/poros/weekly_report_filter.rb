class WeeklyReportFilter
  attr_reader :date_range

  def initialize(params)
    @date_range = params[:date_range]
  end

  def run
    WeeklyReport.within_range(parsed_date_range)
  end

  private

  def parsed_date_range
    return DateRange.current_week unless date_range.present?

    mapped_range = date_range.split(' - ').map do |date_string|
      Date.strptime(date_string, '%m/%d/%Y')
    end

    mapped_range.first...mapped_range.last
  end
end
