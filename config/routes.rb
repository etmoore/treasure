Rails.application.routes.draw do

  resources :users

  root "pages#home"
  get '/auth/:provider/callback' => 'authentications#create'
  get '/sign-out' => 'authentications#destroy', as: :signout
  post '/tweets' => 'tweets#create'

end
