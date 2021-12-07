class DropTableGirls < ActiveRecord::Migration[6.1]
  def change
    drop_table :girls
  end
end
