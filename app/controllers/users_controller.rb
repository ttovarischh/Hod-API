class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
        # if users
        #   render json: {status: "SUCCESS", message: "All users ready", data: users}, status: :ok
        # else
        #   render json: users.errors, status: :bad_request
        # end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end
end