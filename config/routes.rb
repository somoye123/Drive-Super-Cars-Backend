Rails.application.routes.draw do
  resources :cars
  scope module: 'api' do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
