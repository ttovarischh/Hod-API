class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json


  # def create
  #   user = User.new(sign_up_params)

  #   if user.save
  #     render json: {user: user, message: 'sign up success', is_success: true}, status: :ok
  #   else
  #     render json: {message: 'Sign up failed', is_success: false}, status: :unprocessable_entity
  #   end
  # end

  # private
  # def respond_with(resource, _opts = {})
  #   render json: { message: 'Logged.' }, status: :ok
  # end
end