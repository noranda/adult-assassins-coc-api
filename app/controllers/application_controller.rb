class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token!
  before_action :require_user_session!

  private

  def authenticate_user_from_token!
    authorization_header = request.headers['Authorization']
    return unless authorization_header.present?

    user_id, user_token = user_information_from_header(authorization_header)

    @current_session = UserSession.active.where(token: user_token, user_id: user_id).first if user_id.present? && user_token.present?
    @current_session.access(request) if @current_session.present?
  end

  def current_user
    @current_user ||= @current_session.try(:user)
  end

  def require_user_session!
    render(json: { message: 'You must be logged in to view this page' }, status: 401) unless @current_session.present?
  end

  def user_information_from_header(authorization_header)
    token_chunks = /^Token token="(?<user_token>[a-zA-Z0-9\-_]+)", user_id="(?<user_id>\d+)"$/.match(authorization_header)

    [token_chunks[:user_id], token_chunks[:user_token]]
  end
end
