class RemoveCompanyFromJob < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :company, :string
  end
end
