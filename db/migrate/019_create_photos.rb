class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column :description, :string
      t.column :content_type, :string
      t.column :filename, :string
      t.column :binary_data, :binary, :limit => 2.megabytes
      t.column :thumbnail_data, :binary, :limit => 500.kilobytes
    end
  end

  def self.down
    drop_table :photos
  end
end
