class AddJobApplicationToApplies < ActiveRecord::Migration[6.1]
  def change
    add_column :applies, :job_application, :text
  end
end
