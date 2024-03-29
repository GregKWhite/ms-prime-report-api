# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    CMS_PASSWORD = ENV.fetch('CMS_PASSWORD')

    before_action :authenticate_admin

    def authenticate_admin
      authenticate_or_request_with_http_basic do |_, password|
        password == CMS_PASSWORD
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
    def records_per_page
      params[:per_page] || 20
    end
  end
end
