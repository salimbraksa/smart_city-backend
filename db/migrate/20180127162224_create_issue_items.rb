class CreateIssueItems < ActiveRecord::Migration[5.1]
  def change
    create_table :issue_items do |t|
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
