Rails.application.routes.draw do
  namespace :admin do
    resources :locations
    resources :drivers
  end
end
