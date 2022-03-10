class AddCoordinatesToBeaches < ActiveRecord::Migration[6.1]
  def change
    add_column :beaches, :latitude, :float
    add_column :beaches, :longitude, :float
  end
end
