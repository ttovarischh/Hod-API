Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: %i[index show]
    end
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