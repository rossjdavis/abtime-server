class EmployeeController < ApplicationController
  before_action :authenticate_user

  def clock_in
    puts 'clock in'
    # current_user.logs.create!
    # @logs = Log.where(user_id: current_user.id)
    # render json: { logs: @logs }
  end

  def clock_out

  end

end
