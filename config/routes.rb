SimpleForum::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'home#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider/failure', to: 'sessions#new'
  get '/auth/:provider', to: lambda{|env| [404,{},["Not Found"]]}
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy'
end
