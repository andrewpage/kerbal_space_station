class AddUploadToDownloadables < ActiveRecord::Migration
  def change
    add_column :downloadables, :upload, :string
    add_index :downloadables, :upload
  end
end
