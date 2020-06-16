class Admins::StaffsController < ApplicationController
  before_action :set_staff, only: %i[show edit]

  def index
    @staffs = Staff.order(:family_name_kana, :given_name_kana)
  end

  def show
    redirect_to [ :edit, :admins, @staff ]
  end

  def new
    @staff = Staff.new
  end

  def edit; end

  def create
    @staff = Staff.new(params[:staff])
    if @staff.save
      redirect_to :admins_staffs
    else
      render action: "new"
    end
  end

  private

  def set_staff
    @staff = Staff.find_by(id: params[:id])
  end
end
