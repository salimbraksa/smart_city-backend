class AddLatitudeAndLongitudeToIssue < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :latitude, :float
    add_column :issues, :longitude, :float
  end
end
