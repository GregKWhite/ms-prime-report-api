Rails.application.routes.draw do
  namespace :admin do
    resources :driver_reports
    resources :weekly_reports
    resources :locations
    resources :trucks
    resources :drivers
  end
end
