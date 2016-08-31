Rails.application.routes.draw do
  namespace :admin do
    resources :drivers
  end
end
