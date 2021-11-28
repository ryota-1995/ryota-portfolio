class ChangeColumnTitleIdToLiveId < ActiveRecord::Migration[6.1]
  def change
    rename_column :performers, :title_id, :live_id
  end
end
