module API
  class TrucksController < ApplicationController
    def index
      render json: Truck.all
    end
  end
end
