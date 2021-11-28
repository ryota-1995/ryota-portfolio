class ChangeDataDateToLives < ActiveRecord::Migration[6.1]
  def change
    change_column :lives, :date, :date
  end
end
