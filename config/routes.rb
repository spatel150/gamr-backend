Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api do 
      namespace :v1 do
        resources :users, only: [:create, :show]
        resources :games
        # resources :purchases
        post '/', to: 'sessions#create', as: ""
        post '/signup', to: 'users#create', as: "signup"
        post '/purchases', to: 'purchases#create', as: "cardDetails"
        get '/purchases/:username', to: 'purchases#show_games', as: "cart"
        delete '/purchases/:id', to: 'purchases#delete'
    end 
  end    
end 
