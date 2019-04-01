Rails.application.routes.draw do
  devise_for :users

  resources :tickets
  resource :search, only: %i[show]

  namespace :admin do
    resources :routes do
      patch 'update_position', to: 'routes#update_positions', on: :member
    end
    resources :trains do
      resources :wagons
    end
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :tickets
  end
  get 'welcome/index'

  root 'welcome#index'
  # root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
