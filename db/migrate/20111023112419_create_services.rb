class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :cached_slug
      t.string :departs_platform
      t.text :notes

      t.timestamps
    end
  end
end
