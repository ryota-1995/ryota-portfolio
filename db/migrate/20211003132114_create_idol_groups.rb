class CreateIdolGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :idol_groups do |t|
      t.string :place
      t.string :youtube_url

      t.timestamps
    end
  end
end
