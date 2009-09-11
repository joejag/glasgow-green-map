class CreatePostcodeMapping < ActiveRecord::Migration
  def self.up
    create_table :postcodes do |t|
      t.column :postcode, :string
      t.column :longitude, :string
      t.column :latitude, :string
    end
  end
  
  def self.down
    drop_table :postcodes
  end
end
