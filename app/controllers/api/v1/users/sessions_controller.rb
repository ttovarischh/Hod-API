class Api::V1::Users::SessionsController < Devise::SessionsController
  require 'json_web_token'
  before_action :authenticate_user!, only: [:destroy]
  skip_before_action :verify_signed_out_user, only: :destroy
  respond_to :json

  def create
    user = User.find_by(email: params[:session][:user][:email])
    if user && user.valid_password?(params[:session][:user][:password])
      jwt = JsonWebToken.encode(user_id: user.id)
      render json: { jwt: jwt, id: user.id, email: user.email, username: user.username, jti: user.jti, created_at: user.created_at, updated_at: user.updated_at }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    render json: "OK", status: :ok
  end
end