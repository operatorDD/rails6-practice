module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :rescue_500
    rescue_from ApplicationController::Forbidden, with: :rescue_403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue_403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
  end

  private

  def rescue_403(e)
    @exception = e
    render 'errors/forbidden', status: 403
  end

  def rescue_404(e)
    render 'errors/not_found_record'
  end

  def rescue_500(e)
    render 'errors/internal_server_error', status: 500
  end
end
