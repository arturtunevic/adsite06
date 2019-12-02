Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  post '/create_guest_user', to: 'application#create_guest_user', as: 'guest_user'
  delete '/delete_guest_session', to: 'application#delete_guest_session', as: 'delete_guest_session'

  get '/ads/:id', to: 'ad#show', as: "show_ad"
  post '/ads', to: 'ad#create', as: "create_ad"
  put '/ads/:id', to: 'ad#update', as: "update_ad"
  delete '/ads/:id', to: 'ad#delete', as: "delete_ad"
  get '/ads/:id/my_ads', to: 'ad#user_ads', as: "my_ads"

end
