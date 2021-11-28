class ChangeColumnPerformerToHref < ActiveRecord::Migration[6.1]
  def change
    rename_column :lives, :performer, :href
  end
end
