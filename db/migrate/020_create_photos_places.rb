class CreatePhotosPlaces < ActiveRecord::Migration
  def self.up
    create_table :photos_places, :id => false do |t|
      t.column :photo_id, :integer
      t.column :place_id, :integer
    end
  end

  def self.down
    drop_table :photos_places
  end
end
