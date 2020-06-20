class AddSuspendedToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :suspended, :boolean, null: false, default: false, comment: '無効フラグ'
  end
end
