class AdminAuthController < ApplicationController

  def create
    puts "admin request"
    render json: { admin: @current_user.is_admin }
  end

end
