Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  # map the root of application to 'welcome/index' for localhost:3000
end
