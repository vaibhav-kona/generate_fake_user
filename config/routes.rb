Rails.application.routes.draw do
  get 'users/get'
  get 'users/put'
  get 'users/post'
  get 'users/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#get'

  post '/users', to: 'users#post'

  put '/users/:user_id', to: 'users#put'

  delete '/users/:user_id', to: 'users#delete'
end
