Rails.application.routes.draw do
  root 'items#index'
  resources :sells, only: [:index,:create,:show]
end
