class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  # include ErrorHandlers

  private

  def set_layout
    if params[:controller].match(%r{\A(staffs|admins|customers)/})
      Regexp.last_match[1]
    else
      'customers'
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admins_root_path
    elsif resource.is_a?(Staff)
      staffs_root_path
    elsif resource.is_a?(Customer)
      customers_root_path
    end
  end
end
