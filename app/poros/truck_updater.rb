class TruckUpdater
  def self.update_using(driver_report)
    driver_report.truck.update(mileage: driver_report.mileage)
  end
end
