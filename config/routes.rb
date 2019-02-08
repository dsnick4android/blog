Rails.application.routes.draw do
  resources :users
  resources :posts
  get 'home/index'
  get 'home/about'
  get 'home/portfolio'
  get 'home/contact'

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
