Rails.application.routes.draw do
  constraints subdomain: 'api' do
    namespace :v1 do
      resources :companies, only: :index
    end
  end
end
