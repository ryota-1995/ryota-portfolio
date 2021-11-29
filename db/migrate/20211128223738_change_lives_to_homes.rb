class ChangeLivesToHomes < ActiveRecord::Migration[6.1]
  def change
    rename_table :lives, :homes
  end
end
