class ChangeIdolsToGirls < ActiveRecord::Migration[6.1]
  def change
    rename_table :idols, :girls
  end
end
