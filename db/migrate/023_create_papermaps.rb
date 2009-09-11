class CreatePapermaps < ActiveRecord::Migration
  def self.up
    create_table :papermaps do |t|
    end
  end

  def self.down
    drop_table :papermaps
  end
end
