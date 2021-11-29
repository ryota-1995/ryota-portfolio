class RenameUsersTables < ActiveRecord::Migration[6.1]
  def change
    rename_table :users_tables, :users
  end
end
