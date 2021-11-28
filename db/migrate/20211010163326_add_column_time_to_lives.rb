class AddColumnTimeToLives < ActiveRecord::Migration[6.1]
  def change
    add_column :lives, :time, :string
  end
end
