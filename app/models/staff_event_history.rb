class StaffEventHistory < ApplicationRecord
  belongs_to :staff

  enum event: { login: 0, logout: 1 }
end
