class UserTokenController < ApplicationController
  skip_before_action :authorize_request
  #
  # def create
  #   command = AuthenticateUser.call(params[:username], params[:password])
  #
  #   if command.success?
  #     render json: { token: command.result }
  #   else
  #     puts 'command failure'
  #     render json: { error: command.errors }, status: :unauthorized
  #   end
  # end

  def authenticate_user
    user = User.find_for_database_authentication(username: params[:username])
    if user and user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: { error: ['Invalid Username or Password'] }, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      token: JsonWebToken.encode({ user_id: user.id })
      # admin: user.is_admin?
    }
  end
end
