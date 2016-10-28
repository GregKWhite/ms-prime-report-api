module Admin
  class TruckLogsController < Admin::ApplicationController
    before_action :find_truck, only: %i(index create)

    def index
      search_term = params[:search].to_s.strip
      resources = Administrate::Search.new(resource_resolver, search_term).run
      resources = resources.merge(@truck.truck_logs)
      resources = order.apply(resources)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
      }
    end

    def create
      resource = @truck.truck_logs.new(resource_params)

      if resource.save
        redirect_to(
          admin_truck_log_path(resource),
          notice: 'Truck Log was successfully created.'
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
      end
    end

    def destroy
      requested_resource.destroy
      flash[:notice] = translate_with_resource("destroy.success")
      redirect_to admin_truck_truck_logs_path(requested_resource.truck)
    end

    def find_truck
      @truck = Truck.find(params[:truck_id])
    end
  end
end
