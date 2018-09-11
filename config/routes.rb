Rails.application.routes.draw do
  root 'static_pages#home'
  get '/shuffle', to: 'static_pages#shuffle'
  post '/shuffle', to: 'static_pages#shuffle'
end
