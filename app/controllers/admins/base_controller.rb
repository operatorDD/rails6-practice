class Admins::BaseController < ApplicationController
  before_action :admin_user?

  def admin_user?
    return unless current_admin.nil?

    flash[:alert] = '管理者としてログインしてください'
    redirect_to :new_admin_session
  end
end
