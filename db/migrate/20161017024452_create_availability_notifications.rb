class CreateAvailabilityNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :availability_notifications do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
