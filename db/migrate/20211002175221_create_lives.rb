class CreateLives < ActiveRecord::Migration[6.1]
  def change
    create_table :lives do |t|
      t.string :title
      t.string :date
      t.string :performer
      t.string :place

      t.timestamps
    end
  end
end
