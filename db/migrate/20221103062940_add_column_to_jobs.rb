class AddColumnToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :category, :string
    add_column :jobs, :email, :string
    add_column :jobs, :perks, :text
    add_column :jobs, :pay, :string
    add_column :jobs, :twitter, :string
  end
end
