Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  # resources method can be use to declare a standard REST resource.

  root 'welcome#index'
  # map the root of application to 'welcome/index' for localhost:3000
end
