class AddCoordinatesToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :latitude, :float
    add_column :reservations, :longitude, :float
  end
end
