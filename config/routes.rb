Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  scope :api, defaults: { format: :json } do
    scope :v1 do
      # Common routes
      resources :games, only: [:index, :show, :create, :update, :destroy] do
        resources :players, only: [:index, :show, :create, :update, :destroy] do
          get '/effects', to: 'players#effects'
          post '/effects', to: 'players#add_effect', on: :member
          delete '/effects', to: 'players#remove_effect'
        end
        resources :monsters, only: [:index, :show, :create, :update, :destroy] do
          get '/effects', to: 'monsters#effects'
          post '/effects', to: 'monsters#add_effect', on: :member
          delete '/effects', to: 'monsters#remove_effect'
        end
      end
      resources :effects, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: %i[index show update]

      # Auth routes
      devise_for :users, defaults: { format: :json }, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }
    end
  end
end