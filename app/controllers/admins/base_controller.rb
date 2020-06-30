class Admins::BaseController < ApplicationController
  before_action :admin_user?
  before_action :check_invalid_acount

  private

  def admin_user?
    return unless current_admin.nil?

    flash[:alert] = '管理者としてログインしてください'
    redirect_to :new_admin_session
  end

  def check_invalid_acount
    return unless current_admin && current_admin&.suspended?

    sign_out
    flash[:alert] = 'アカウントが無効になりました。'
    redirect_to :admins_root
  end
end
