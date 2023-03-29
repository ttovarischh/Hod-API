Rails.application.routes.draw do
  get 'welcome/index'
  get 'effects/index'
  get 'games/index'
  post "", to: "welcome#redirect", as: :redirect
  root 'welcome#index'

  resources :games do
    resources :players
    resources :monsters
  end

  scope '/api/v1' do
    resources :games, only: [:index, :show, :create, :update, :destroy] do
      resources :players, only: [:index, :show, :create, :update, :destroy]
    end
    resources :effects, only: [:index, :show, :create, :update, :destroy]
    resources :slug
    resources :users, only: %i[index show update]
  end

  scope :api, defaults: { format: :json } do
    scope :v1 do
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