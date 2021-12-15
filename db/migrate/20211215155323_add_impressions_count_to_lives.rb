class AddImpressionsCountToLives < ActiveRecord::Migration[6.1]
  def change
    add_column :lives, :impressions_count, :integer, default: 0
  end
end
