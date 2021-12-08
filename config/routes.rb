# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/:permalink' => 'pages#permalink', as: 'permalink'
  root to: 'products#index'

  resources :products do
    collection do
      get 'search'
      get 'filter'
    end
  end

  resources :cart do
    collection do
      get 'invoice'
    end
  end

  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
