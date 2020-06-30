class Admins::StaffEventHistoriesController < Admins::BaseController
  def index
    if params[:staff_id]
      @staff = Staff.find(params[:staff_id])
      event_histories = @staff.staff_event_histories
    else
      event_histories = StaffEventHistory.all
    end
    @event_histories = event_histories.includes(:staff).order_created_desc
                                      .page(params[:page])
  end
end
