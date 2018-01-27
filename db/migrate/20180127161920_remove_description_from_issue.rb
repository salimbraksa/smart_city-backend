class RemoveDescriptionFromIssue < ActiveRecord::Migration[5.1]
  def change
    remove_column :issues, :description, :string
  end
end
