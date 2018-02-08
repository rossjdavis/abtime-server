class EmployeeController < ApplicationController

  def clock_in
    @current_user.logs.create!
    @logs = Log.where(user_id: @current_user.id)
    render json: @logs
  end

  def clock_out

  end

end
