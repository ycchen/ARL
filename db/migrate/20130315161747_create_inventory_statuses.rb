
class CreateInventoryStatuses < ActiveRecord::Migration
  def change
    create_table :inventory_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
