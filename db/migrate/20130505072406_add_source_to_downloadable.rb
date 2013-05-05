class AddSourceToDownloadable < ActiveRecord::Migration
  def change
    add_column :downloadables, :source, :string
    add_index :downloadables, :source
  end
end
