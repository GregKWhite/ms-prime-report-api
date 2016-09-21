module Admin
  class DriverReportsController < Admin::ApplicationController
    helper :driver_reports

    def index
      resources = order.apply(driver_reports)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        page: page,
      }
    end

    def table
      resources = order.apply(driver_reports)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: { page: page, resources: resources }, layout: false
    end

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

    private

    def driver_reports
      DriverReportFilter.new(params).run
    end
  end
end
