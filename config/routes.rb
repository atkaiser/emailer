Emailer::Application.routes.draw do
  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  resources :requests, :only => [:index, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/send' => 'sender#send_out', :as => :send_out
  post '/users/:id/request_limit' => 'users#request_limit', :as => :request_limit
end
