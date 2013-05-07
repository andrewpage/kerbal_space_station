class CreateDownloadsTags < ActiveRecord::Migration
  def change
    create_table :downloadables_tags do |t|
      t.belongs_to :tag
      t.belongs_to :downloadable
    end
    add_index :downloadables_tags, :tag_id
    add_index :downloadables_tags, :downloadable_id
  end
end
