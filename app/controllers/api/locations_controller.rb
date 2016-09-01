module API
  class LocationsController < ApplicationController
    def index
      render json: Location.all
    end
  end
end
