class CreateCategoriesInventories < ActiveRecord::Migration
  def change
    create_table :categories_inventories do |t|
      t.references :category
      t.references :inventory

      t.timestamps
    end
    add_index :categories_inventories, :category_id
    add_index :categories_inventories, :inventory_id
  end
end
