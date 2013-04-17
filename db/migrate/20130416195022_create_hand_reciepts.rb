class CreateHandReciepts < ActiveRecord::Migration
  def change
    create_table :hand_reciepts do |t|
      t.string :reciept
      t.references :user

      t.timestamps
    end
    add_index :hand_reciepts, :user_id
  end
end
