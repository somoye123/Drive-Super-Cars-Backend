Rails.application.routes.draw do
  root to: "api/v1/users#index"
  get 'rails/active_storage/blobs/:signed_id/*filename', to: 'active_storage/blobs#show'
  scope module: 'api' do
    namespace :v1 do
      resources :users, only: %i[create show]
      resources :cars, only: %i[index show create]
      post 'appointments', to: 'users#new_appointment'
    end
  end
end
