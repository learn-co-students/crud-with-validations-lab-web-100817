Rails.application.routes.draw do
  root 'songs#index'
  resources :songs, only: [:index, :new, :edit, :update, :create, :show, :destroy]
end
