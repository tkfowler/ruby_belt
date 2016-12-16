Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/main' => 'users#main'

  get '/users/:id' => 'users#show'

  get '/songs' => 'songs#index'

  get '/songs/:id' => 'songs#show'

  post '/create' => 'users#create'

  post '/login' => 'sessions#create'

  post '/new' => 'songs#create'

  post '/add/:id' => 'playlists#add'

  delete '/logout' => 'sessions#destroy'
end
