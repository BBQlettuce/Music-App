class AddTypeToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :record_type, :string, null: false
  end
end
