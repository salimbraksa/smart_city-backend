class AddCityToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :city, :string
  end
end
