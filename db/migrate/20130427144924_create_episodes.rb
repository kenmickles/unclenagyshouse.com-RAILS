class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :number, :limit => 24
      t.string :title, :null => false
      t.date :date
      t.string :synopsis
      t.integer :vimeo_id

      t.timestamps
    end
  end
end
