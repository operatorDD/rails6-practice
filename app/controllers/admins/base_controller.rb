class Admins::BaseController < ApplicationController
  before_action :admin_user?

  def admin_user?
    if current_admin.nil?
      flash[:alert] = '管理者としてログインしてください'
      redirect_to :new_admin_session
    end
  end
end
