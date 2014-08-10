Rails.application.routes.draw do
  root :to => 'welcome#index'

  namespace :v1 do
    resources :companies, only: :index
  end
end
