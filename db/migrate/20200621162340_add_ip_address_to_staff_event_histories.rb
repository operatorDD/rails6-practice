class AddIpAddressToStaffEventHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :staff_event_histories, :ip_address, :string, comment: '接続IPアドレス'
  end
end
