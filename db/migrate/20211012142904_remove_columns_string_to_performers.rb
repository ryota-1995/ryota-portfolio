class RemoveColumnsStringToPerformers < ActiveRecord::Migration[6.1]
  def change
    remove_column :performers, :string, :string
  end
end
