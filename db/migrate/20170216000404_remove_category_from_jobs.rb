class RemoveCategoryFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :name, :string
  end
end
