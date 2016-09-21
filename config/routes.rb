Rails.application.routes.draw do
  scope '', module: 'admin', as: 'admin' do
    resources :driver_reports do
      get 'table', on: :collection
    end
    resources :weekly_reports do
      get 'table', on: :collection
    end
    resources :locations
    resources :drivers
    resources :trucks

    root to: redirect('/driver_reports')
  end

  namespace :api do
    resources :locations, only: %i(index)
    resources :drivers, only: %i(index)
    resources :trucks, only: %i(index)

    post 'report', to: 'driver_reports#create'
  end
end
