class CreatePlacesTags < ActiveRecord::Migration
  def self.up
    create_table :places_tags, :id => false do |t|
      t.column :place_id, :integer
      t.column :tag_id, :integer
    end
  end

  def self.down
    drop_table :places_tags
  end
end
