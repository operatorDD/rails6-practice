class StaffEventHistory < ApplicationRecord
  belongs_to :staff

  enum event: { login: 0, logout: 1 }

  scope :order_created_desc, -> { order(created_at: :desc) }
end
