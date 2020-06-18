class Staffs::BaseController < ApplicationController
  before_action :staff_user?

  private

  def staff_user?
    return unless current_staff.nil?

    flash[:alert] = '職員としてログインしてください'
    redirect_to :new_staff_session
  end

  def active_staff?
    if current_staff.start_date > Date.today || current_staff.end_date < Date.today || current_staff.suspended
      false
    else
      true
    end
  end
end
