Rails.application.routes.draw do
  root "products#index"
  get "pages/:permalink" => "pages#permalink", as: "permalink"

  resources :products
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
