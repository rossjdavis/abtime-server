class ApplicationController < ActionController::API
  before_action :authorize_request

  # include Knock::Authenticable
  #
  # before_action :authenticate_user
  #
  # before_action :authorize_request
  #
  # attr_reader :current_user
  #
  # private
  #
  # def authorize_request
  #   @current_user = AuthorizeRequest.call(request.headers).result
  #   render json: { error: 'Not Authorized'}, status: 401 unless @current_user
  # end


  attr_reader :current_user

  protected
  def authorize_request
    unless user_id_in_token
      render json: { error: ['Unauthorized'] }, status: :unauthorized
      return
    end

    @current_user = User.find(auth_token[:user_id])

  rescue JWT::VerificationError, JWT::DecodeError
    render json: { error: ['Unauthorized'] }, status: :unauthorized
  end

  private
  def http_token
    request.headers.each { |header| puts header }
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
