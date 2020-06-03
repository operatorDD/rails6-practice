class Admins::StaffsController < ApplicationController
  def index
    @staffs = Staff.order(:family_name_kana, :given_name_kana)
  end
end
