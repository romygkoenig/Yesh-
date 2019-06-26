class RemoveCoordinatesFromPerformances < ActiveRecord::Migration[5.2]
  def change
    remove_column :performances, :latitude, :float
    remove_column :performances, :longitude, :float
  end
end
