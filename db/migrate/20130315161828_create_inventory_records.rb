
class CreateInventoryRecords < ActiveRecord::Migration
  def change
    create_table :inventory_records do |t|
      t.references :user
      t.references :inventory
      t.references :inventory_status
      t.references :location
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
    add_index :inventory_records, :user_id
    add_index :inventory_records, :inventory_id
    add_index :inventory_records, :inventory_status_id
    add_index :inventory_records, :location_id
  end
end
