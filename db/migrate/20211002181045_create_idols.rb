class CreateIdols < ActiveRecord::Migration[6.1]
  def change
    create_table :idols do |t|
      t.string :name
      t.string :idol_group
      t.date :birthday
      t.integer :age
      t.date :birthplace
      t.integer :height
      t.integer :debut_year
      t.string :office
      t.string :music_label
      t.string :hp_url

      t.timestamps
    end
  end
end
