class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :cached_slug

      t.timestamps
    end
  end
end
