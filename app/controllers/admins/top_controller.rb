

class Admins::TopController < Admins::BaseController
  skip_before_action :admin_user?

  def index
    if current_admin
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end
end
