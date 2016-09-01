class WeeklyReportUpdater
  def self.update_using(driver_report)
    weekly_report = WeeklyReport.current.find_by(truck_id: driver_report.truck_id)

    weekly_report.total_gas += driver_report.gallons
    weekly_report.total_paid += driver_report.amount_paid
    weekly_report.current_mileage = driver_report.mileage

    weekly_report.save
  end
end
