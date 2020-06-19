class Staffs::BaseController < ApplicationController
  before_action :staff_user?
  before_action :check_invalid_acount

  private

  def staff_user?
    return unless current_staff.nil?

    flash[:alert] = '職員としてログインしてください'
    redirect_to :new_staff_session
  end

  def check_invalid_acount
    return unless current_staff && invalid_staff?

    session.delete(:staff_id)
    flash[:alert] = 'アカウントが無効になりました。'
    redirect_to :staffs_root
  end

  def invalid_staff?
    start_date = current_staff.start_date
    end_date = current_staff.end_date
    start_date >= Date.today && end_date < Date.today
  end
end
