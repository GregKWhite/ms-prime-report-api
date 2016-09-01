Rails.application.routes.draw do
  scope '', module: 'admin', as: 'admin' do
    resources :driver_reports
    resources :weekly_reports
    resources :locations
    resources :trucks
    resources :drivers

    root to: 'driver_reports#index'
  end

  namespace :api do
    resources :locations, only: %i(index)
    resources :drivers, only: %i(index)
    resources :trucks, only: %i(index)
  end
end
