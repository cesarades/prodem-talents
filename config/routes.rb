Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  resources :contacts, only: %i[new create]
  resources :meetings, only: %i[index show create]
end
