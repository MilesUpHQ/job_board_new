class RenameJobReference < ActiveRecord::Migration[6.1]
  def change
    rename_column :applies, :jobs_id, :job_id
  end
end
