class AuthenticationController < ApplicationController
  skip_before_action :auth_request

  def authenticate
    command = AuthenticateUser.call(params[:username], params[:password])

    if command.success?
      render json: { token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
