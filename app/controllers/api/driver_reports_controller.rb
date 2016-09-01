module API
  class DriverReportsController < ApplicationController
    def create
      driver_report = DriverReport.new(driver_report_params)

      if driver_report.save
        WeeklyReportUpdater.update_using(driver_report)
        TruckUpdater.update_using(driver_report)
        render json: driver_report
      else
        render resource_errors(driver_report)
      end
    end

    private

    def create_weekly_truck_reports
      return if WeeklyReport.current.count > 0

      WeeklyReport.create_weekly_reports!
    end

    def driver_report_params
      params.require(:driver_report).permit(*attributes)
    end

    def attributes
      %i(driver_id helper_id gallons amount_paid notes location_id truck_id mileage)
    end
  end
end
