Rails.application.routes.draw do
  devise_for :users
  resources :games
  resource :subscription
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "games#index"
end
