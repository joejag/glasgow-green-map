class CreatePlace < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.column "name", :string
      t.column "address", :string
      t.column "postcode", :string
      t.column "about", :text
      t.column "longitude", :float
      t.column "latitude", :float
    end
  end
  
  def self.down
    drop_table :places
  end
end
