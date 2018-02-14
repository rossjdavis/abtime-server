class UserTokenController < ApplicationController
  skip_before_action :authorize_request

  def create
    command = AuthenticateUser.call(params[:username], params[:password])

    if command.success?
      render json: { token: command.result }
    else
      puts 'command failure'
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
