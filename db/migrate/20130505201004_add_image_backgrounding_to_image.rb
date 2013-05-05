class AddImageBackgroundingToImage < ActiveRecord::Migration
  def change
    add_column :images, :image_processing, :boolean
    add_index :images, :image_processing
    add_column :images, :image_tmp, :string
    add_index :images, :image_tmp
  end
end
