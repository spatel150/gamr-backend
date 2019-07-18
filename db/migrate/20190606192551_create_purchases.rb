class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :username
      t.string :game_identifier 
      t.integer :price
      t.timestamps
    end
  end
end
