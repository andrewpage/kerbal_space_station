class AddLicenseToDownloadable < ActiveRecord::Migration
  def change
    add_column :downloadables, :license, :text
  end
end
