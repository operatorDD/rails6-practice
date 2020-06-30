class Staffs::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
    current_staff.staff_event_histories.create(staff_history_params(:login))
  end

  def destroy
    current_staff.staff_event_histories.create(staff_history_params(:logout))
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    redirect_to :staffs_root
  end

  private

  def staff_history_params(event)
    { ip_address: request.remote_ip, event: event }
  end
end
