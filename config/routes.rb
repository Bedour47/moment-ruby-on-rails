Rails.application.routes.draw do
  get 'posts/all_posts'
  resources :likes
  resources :posts do
    resources :likes
  end
  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
