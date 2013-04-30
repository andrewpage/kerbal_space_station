class CreateDownloadables < ActiveRecord::Migration
  def change
    create_table :downloadables do |t|
      t.string :name
      t.string :version
      t.string :compatible
      t.text :description
      t.text :changelog
      t.text :install
      t.belongs_to :account

      t.timestamps
    end
    add_index :downloadables, :name
    add_index :downloadables, :account_id
    add_index :downloadables, :version
    add_index :downloadables, :compatible
  end
end
