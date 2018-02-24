class AdminAuthController < ApplicationController

  def check_permissions
    puts "admin request"
    render json: { admin: @current_user.is_admin }
  end
end
