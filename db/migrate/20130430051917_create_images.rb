class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.boolean :primary
      t.belongs_to :downloadable

      t.timestamps
    end
    add_index :images, :image
    add_index :images, :primary
    add_index :images, :downloadable_id
  end
end
