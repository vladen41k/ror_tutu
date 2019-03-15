Rails.application.routes.draw do
  resources :trains do
    resources :wagons
  end
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes do
    patch 'update_position', to: 'routes#update_positions', on: :member
  end
  resources :tickets
  resources :users
  resource :search, only: [:new, :show, :edit]
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
