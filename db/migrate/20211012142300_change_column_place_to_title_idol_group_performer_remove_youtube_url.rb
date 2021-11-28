class ChangeColumnPlaceToTitleIdolGroupPerformerRemoveYoutubeUrl < ActiveRecord::Migration[6.1]
  def change
    rename_column :performers, :idol_groups, :performer
    rename_column :performers, :youtube_url, :string
  end
end
