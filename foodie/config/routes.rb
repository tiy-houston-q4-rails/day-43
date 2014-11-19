Rails.application.routes.draw do
  resources :api_keys

  resources :foodies, except: [:new, :edit]
end
