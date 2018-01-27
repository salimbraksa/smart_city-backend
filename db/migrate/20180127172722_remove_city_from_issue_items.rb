class RemoveCityFromIssueItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :issue_items, :city, :string
  end
end
