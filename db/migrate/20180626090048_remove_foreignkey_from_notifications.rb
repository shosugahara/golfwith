class RemoveForeignkeyFromNotifications < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :notifications, column: :notified_by_id
  end
end
