class RemoveColumnPerformersFromLives < ActiveRecord::Migration[6.1]
  def change
    remove_column :lives, :performer, :string
  end
end
