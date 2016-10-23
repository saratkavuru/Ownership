class CreateLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :libraries do |t|
      t.integer :name

      t.timestamps
    end
  end
end
