class AddColumnsPerformerToLives < ActiveRecord::Migration[6.1]
  def change
    add_column :lives, :performer, :string
  end
end
