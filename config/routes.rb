Rails.application.routes.draw do
  root :to => 'welcome#index'

  namespace :v1, path: '/1' do
    resources :companies, only: [:index, :show]
  end
end
