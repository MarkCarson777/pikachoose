Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pokemons do
    collection do
      get :my_pokemon
    end
    resources :bookings, only: [ :new, :create] 
  end

  resources :bookings, only: [ :show, :destroy, :index, :edit, :update ]do
    resources :reviews, only: [ :new, :create, :edit, :update ]
  end

  resources :reviews, only: [ :show, :destroy, :index ]
end
