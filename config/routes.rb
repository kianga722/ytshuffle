Rails.application.routes.draw do
  root 'static_pages#home'
  post '/shuffle', to: 'static_pages#shuffle'
end
