Rails.application.routes.draw do
  root 'users#create'
  scope module: 'api' do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
