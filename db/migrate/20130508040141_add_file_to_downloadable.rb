class AddFileToDownloadable < ActiveRecord::Migration
  def change
    add_column :downloadables, :file, :text
  end
end
