class ChangeColumnTitleToTitleId < ActiveRecord::Migration[6.1]
  def change
    rename_column :performers, :live_id, :title_id
  end
end
