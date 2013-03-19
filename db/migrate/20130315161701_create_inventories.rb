
class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :stocknumber
      t.text :description
      t.string :barcode
      t.date :purchase_date

      t.timestamps
    end
  end
end
