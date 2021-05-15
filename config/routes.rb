Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pokemons do
    resources :bookings, only: [ :new, :create, :edit, :update]
    resources :reviews, only: [ :new, :create, :edit, :update ]
  end

  resources :bookings, only: [ :show, :destroy, :index ]

  resources :reviews, only: [ :show, :destroy ]
end
