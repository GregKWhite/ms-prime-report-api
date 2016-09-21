module Admin
  class WeeklyReportsController < Admin::ApplicationController
    def index
      resources = order.apply(weekly_reports)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        page: page,
      }
    end

    def table
      resources = order.apply(weekly_reports)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: { page: page, resources: resources }, layout: false
    end

    private

    def weekly_reports
      WeeklyReportFilter.new(params).run
    end
  end
end
