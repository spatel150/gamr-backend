class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :game_identifier
      t.string :name
      t.string :img_url

      t.timestamps
    end
  end
end
