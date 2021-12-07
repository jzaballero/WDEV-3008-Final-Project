Rails.application.routes.draw do
  get 'pages/:permalink' => 'pages#permalink', as: 'permalink'
  root to: 'products#index'

  resources :products do
    collection do
      get 'search'
      get 'filter'
    end
  end

  resources :cart
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
