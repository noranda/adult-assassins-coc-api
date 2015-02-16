module Api
  class UsersController < ::ApplicationController
    before_action :require_user_session!, except: [:create]

    def create
      user = User.new(register_params)
      if user.save
        render json: UserSerializer.new(user).as_json, status: 201
      else
        render json: { errors: user.errors.full_messages }, status: 422
      end
    end

    def show
      render json: UserSerializer.new(current_user).as_json
    end

    private

    def register_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  end
end
