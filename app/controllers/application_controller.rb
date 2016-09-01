class ApplicationController < ActionController::Base
  def resource_errors(resource)
    {
      json: resource,
      status: 422,
      adapter: :json_api,
      serializer: ActiveModel::Serializer::ErrorSerializer
    }
  end
end
