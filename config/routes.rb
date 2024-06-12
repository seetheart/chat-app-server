Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/register', to: 'authentication#register'
  post '/login', to: 'authentication#login'
  get '/chatroom', to: 'chatroom#index'
  post '/message', to: 'message#create'

  scope :chatroom do
    get '/:name/messages', to: "chatroom#messages"
  end
end
