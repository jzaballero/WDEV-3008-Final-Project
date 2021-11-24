Rails.application.routes.draw do
  get 'categories/index'
  root "products#index"
  get "pages/:permalink" => "pages#permalink", as: "permalink"

  resources :products
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
