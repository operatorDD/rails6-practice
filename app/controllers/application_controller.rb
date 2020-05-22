class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers

  private

  def set_layout
    if params[:controller].match(%r{\A(staffs|admins|customers)/})
      Regexp.last_match[1]
    else
      'customers'
    end
  end
end
