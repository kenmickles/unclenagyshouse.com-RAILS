class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, :null => false
      t.string :facebook_id
      t.string :link

      t.timestamps
    end

    create_table :credits_players, :id => false do |t|
      t.integer :credit_id
      t.integer :player_id
    end
    
    add_index :credits_players, [:credit_id, :player_id], :unique => true
    add_index :credits_players, [:credit_id]
  end
end
