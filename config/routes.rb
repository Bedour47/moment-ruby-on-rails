Rails.application.routes.draw do
  resources :posts, :likes, :users
  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
