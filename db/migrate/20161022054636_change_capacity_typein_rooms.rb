class ChangeCapacityTypeinRooms < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :capacity, :integer
  end
end
