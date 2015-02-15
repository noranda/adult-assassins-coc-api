module Api
  class UserSessionsController < ::ApplicationController
    def create
      user = User.authenticate(login_params[:user_id], login_params[:password])

      if user
        session = UserSession.from_user(user, request)
        render json: UserSessionSerializer.new(session, root: false).as_json, status: 201
      else
        render json: { error: 'Invalid credentials' }, status: 401
      end
    end

    private

    def login_params
      params.require(:user).permit(:user_id, :password)
    end
  end
end
