class AddStatusToCheckouts < ActiveRecord::Migration[5.0]
  def change
    add_column :checkouts, :status, :string
  end
end
