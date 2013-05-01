class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :episode_id, :null => false
      t.string :role, :null => false
      t.string :category, :limit => 24, :null => false
      t.integer :weight, :default => 0, :null => false

      t.timestamps
    end

    add_index :credits, :episode_id
  end
end
