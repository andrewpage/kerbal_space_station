class AddBookmarkCountToDownloadable < ActiveRecord::Migration
  def change
    add_column :downloadables, :bookmark_count, :integer, default: 0
    add_index :downloadables, :bookmark_count
  end
end
