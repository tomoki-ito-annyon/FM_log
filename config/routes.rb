Rails.application.routes.draw do
  resources :sells, only: [:index,:create]
end
