class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :prefered_location, :string
  end
end
