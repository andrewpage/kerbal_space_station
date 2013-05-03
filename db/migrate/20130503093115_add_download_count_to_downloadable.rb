class AddDownloadCountToDownloadable < ActiveRecord::Migration
  def change
    add_column :downloadables, :download_count, :integer, default: 0
    add_index :downloadables, :download_count
  end
end
