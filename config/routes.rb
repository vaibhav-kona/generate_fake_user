Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#get'

  post '/users', to: 'users#post'

  put '/user/:userId', to: 'users#put'

  delete '/user/:userId', to: 'user#delete'
end
