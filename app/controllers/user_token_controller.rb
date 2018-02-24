class UserTokenController < ApplicationController
  skip_before_action :authenticate_user

  private
  def authenticate_user(username, password)
    command = AuthenticateUser.call(username, password)

    if command.success?
      render json: { token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
