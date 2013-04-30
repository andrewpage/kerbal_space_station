class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :upload
      t.boolean :primary
      t.belongs_to :downloadable

      t.timestamps
    end
    add_index :photos, :upload
    add_index :photos, :primary
    add_index :photos, :downloadable_id
  end
end
