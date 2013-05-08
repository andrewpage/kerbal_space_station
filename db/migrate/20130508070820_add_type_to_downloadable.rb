class AddTypeToDownloadable < ActiveRecord::Migration
  def change
    add_column :downloadables, :type, :string
    add_index :downloadables, :type
  end
end
