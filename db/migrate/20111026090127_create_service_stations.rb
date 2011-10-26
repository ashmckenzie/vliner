class CreateServiceStations < ActiveRecord::Migration
  def change
    create_table :service_stations do |t|
      t.integer :service_id
      t.integer :station_id
      t.integer :departs_at
      t.string :departs_at_label
      t.integer :arrives_at
      t.string :arrives_at_label
      t.integer :sort

      t.timestamps
    end
  end
end
