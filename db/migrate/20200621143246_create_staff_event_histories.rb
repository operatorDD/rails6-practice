class CreateStaffEventHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :staff_event_histories do |t|
      t.integer :staff_id, null: false, comment: '職員ID'
      t.integer :event, null: false, commnet: 'イベントタイプ'
      t.timestamps
    end
  end
end
