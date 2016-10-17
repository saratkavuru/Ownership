class AddStatusToSuggestions < ActiveRecord::Migration[5.0]
  def change
    add_column :suggestions, :status, :string
  end
end
