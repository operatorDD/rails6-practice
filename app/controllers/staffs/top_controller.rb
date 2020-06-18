

class Staffs::TopController < Staffs::BaseController
  skip_before_action :staff_user?

  def index
    render action: 'index'
  end
end
