class RenameHomesToLives < ActiveRecord::Migration[6.1]
  def change
    rename_table :homes, :lives
  end
end
