class CreateNearestStation < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
    t.string :rail_line_name
    t.string :station_name
    t.integer :walk

    end
  end
end
