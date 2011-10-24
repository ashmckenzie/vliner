class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :station_id
      t.integer :departs_at
      t.string :departs_at_label
      t.integer :arrives_at
      t.string :arrives_at_label
      t.string :platform
      t.text :notes

      t.timestamps
    end
  end
end
