class AddIssueIdToIssueItems < ActiveRecord::Migration[5.1]
  def change
    add_column :issue_items, :issue_id, :integer
  end
end
