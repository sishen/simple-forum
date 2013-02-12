SimpleForum::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'home#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider/failure', to: 'sessions#new'
  get '/auth/:provider', to: lambda{|env| [404,{},["Not Found"]]}
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new] do
    member do
      get :confirm
    end
  end

  require 'sidekiq/web'
  sidekiq_server = Rack::Builder.new {
    use Rack::Auth::Basic do |user, passwd|
      user == "yedingding" && passwd == "sidekiq rocks"
    end
    run Sidekiq::Web.new
  }.to_app
  mount sidekiq_server => '/sidekiq'

  if Rails.env != 'production'
    mount MailsViewer::Engine, at: '/delivered_mails'
  end
end
