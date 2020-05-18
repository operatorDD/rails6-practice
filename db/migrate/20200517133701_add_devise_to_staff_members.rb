# frozen_string_literal: true

class AddDeviseToStaffMembers < ActiveRecord::Migration[6.0]
  def self.up
    create_table :staff_members do |t|
      ## Database authenticatable
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.string :family_name, null: false, comment: '姓'
      t.string :given_name, null: false, comment: '名'
      t.string :family_name_kana, null: false, comment: '姓（カナ）'
      t.string :given_name_kana, null: false, comment: '名（カナ）'
      t.date :start_date, null: false, comment: '開始日'
      t.date :end_date, comment: '終了日'
      t.boolean :suspended, null: false, default: false, comment: '無効フラグ'
      t.timestamps
    end

    add_index :staff_members, 'LOWER(email)',                unique: true
    add_index :staff_members, :reset_password_token, unique: true
    add_index :staff_members, [ :family_name_kana, :given_name_kana ], unique: false
    # add_index :staff_members, :confirmation_token,   unique: true
    # add_index :staff_members, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
