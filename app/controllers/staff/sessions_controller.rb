class Staff::SessionsController < Devise::SessionsController
  def new
    if current_staff
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: 'new'
    end
  end
end
