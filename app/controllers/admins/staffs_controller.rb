class Admins::StaffsController < Admins::BaseController
  before_action :set_staff, only: %i[show edit update destroy]

  def index
    @staffs = Staff.order(:family_name_kana, :given_name_kana).page(params[:page])
  end

  def show
    redirect_to [:edit, :admins, @staff]
  end

  def new
    @staff = Staff.new
  end

  def edit; end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to :admins_staffs
    else
      render action: 'new'
    end
  end

  def update
    if @staff.update(staff_params)
      redirect_to :admins_staffs
    else
      render action: 'edit'
    end
  end

  def destroy
    if @staff.destroy
      redirect_to :admins_staffs
    else
      flash[:alert] = '職員削除に失敗しました。'
    end
  end

  private

  def set_staff
    @staff = Staff.find_by(id: params[:id])
  end

  def staff_params
    params.require(:staff).permit(:email, :password, :family_name, :given_name, :family_name_kana,
                                  :given_name_kana, :start_date, :suspended)
  end
end
