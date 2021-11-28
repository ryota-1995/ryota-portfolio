class AddIdolGroupToIdolGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :idol_groups, :idol_group, :string
  end
end
