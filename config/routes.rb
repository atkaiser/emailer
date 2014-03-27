Emailer::Application.routes.draw do
  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/send' => 'sender#send_out', :as => :send_out
  post '/users/:id/request_limit' => 'users#request_limit', :as => :request_limit
  get '/requests/:id/grant' => 'requests#grant', :as => :grant
  get '/requests/:id/decline' => 'requests#decline', :as => :decline
  post '/users/:id/increase_limit' => 'users#increase_limit', :as => :increase_limit
  get '/how_to' => 'home#how_to', :as => :how_to
end
