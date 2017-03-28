Rails.application.routes.draw do

  #Crear un usuario
  put '/usuario', to: 'users#create'

  #Obtener un usuario
  get '/usuario/:id', to: 'users#show'

  #Editar un usuario
  post '/usuario/:id', to: 'users#update'

  #Eliminar un usuario
  delete '/usuario/:id', to: 'users#destroy'

  #Listar todos los usuarios
  get '/usuario', to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
