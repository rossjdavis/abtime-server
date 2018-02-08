class ApplicationController < ActionController::API

  include Knock::Authenticable

  # before_action :auth_request
  #
  # attr_reader :current_user
  #
  # private
  #
  # def auth_request
  #   @current_user = AuthorizeRequest.call(request.headers).result
  #   render json: { error: 'Not Authorized'}, status: 401 unless @current_user
  # end
end
