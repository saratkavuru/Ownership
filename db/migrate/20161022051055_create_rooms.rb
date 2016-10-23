class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.string :capacity
      t.references :library

      t.timestamps
    end
    add_foreign_key :rooms, :libraries
end
end
