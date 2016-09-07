class DriverReportFilter
  attr_reader :location_id, :date_range

  def initialize(params)
    @location_id = params[:location_id]
    @date_range = params[:date_range]
  end

  def run
    location.driver_reports.within_range(parsed_date_range)
  end

  private

  def location
    @location = Location.find_by_id(location_id) || Location.first
  end

  def parsed_date_range
    return DateRange.current_week unless date_range.present?

    mapped_range = date_range.split(' - ').map do |date_string|
      Date.strptime(date_string, '%m/%d/%Y')
    end

    mapped_range.first...mapped_range.last
  end
end
