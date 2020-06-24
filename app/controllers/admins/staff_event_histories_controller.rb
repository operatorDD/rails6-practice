class Admins::StaffEventHistoriesController < Admins::BaseController
  def index
    if params[:staff_id]
      @staff = Staff.find(params[:staff_id])
      @event_histories = @staff.staff_event_histories.order_created_desc
    else
      @event_histories = StaffEventHistory.order_created_desc
    end
    @event_histories = @event_histories.page(params[:page])
  end
end
