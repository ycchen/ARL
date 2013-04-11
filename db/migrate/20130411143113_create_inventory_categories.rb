class CreateInventoryCategories < ActiveRecord::Migration
  def change
    create_table :inventory_categories do |t|
      t.references :inventory
      t.references :category

      t.timestamps
    end
    add_index :inventory_categories, :inventory_id
    add_index :inventory_categories, :category_id
  end
end
