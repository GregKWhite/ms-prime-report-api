Rails.application.routes.draw do
  namespace :admin do
    resources :driver_reports
    resources :locations
    resources :drivers
  end
end
