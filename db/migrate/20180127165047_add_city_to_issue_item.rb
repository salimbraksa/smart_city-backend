class AddCityToIssueItem < ActiveRecord::Migration[5.1]
  def change
    add_column :issue_items, :city, :string
  end
end
