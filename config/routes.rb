Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  get 'welcome/index'

  resources :articles
  # resources method can be use to declare a standard REST resource.

  root 'welcome#index'
  # map the root of application to 'welcome/index' for localhost:3000
end
