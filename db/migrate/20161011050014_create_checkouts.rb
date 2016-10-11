class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :start_time
      t.timestamps
    end
  end
end
