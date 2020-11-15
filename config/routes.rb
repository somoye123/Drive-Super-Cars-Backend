Rails.application.routes.draw do
  root to: "api/v1/users#index"
  scope module: 'api' do
    namespace :v1 do
      resources :users, only: %i[create show]
      resources :cars, only: %i[index show create]
      post 'appointments', to: 'users#new_appointment'
    end
  end
end
