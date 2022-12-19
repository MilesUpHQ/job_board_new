class AddCompanyNameToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :company_name, :string
  end
end
