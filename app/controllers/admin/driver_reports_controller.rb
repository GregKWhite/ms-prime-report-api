module Admin
  class DriverReportsController < Admin::ApplicationController
    def create
      resource = resource_class.new(resource_params)

      if resource.save
        WeeklyReportUpdater.update_using(resource)
        TruckUpdater.update_using(resource)

        redirect_to(
          [namespace, resource],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
      end
    end
  end
end
