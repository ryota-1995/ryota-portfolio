class ChangeIdolGroupsToPerformers < ActiveRecord::Migration[6.1]
  def change
    rename_table :idol_groups, :performers
  end
end
