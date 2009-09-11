class CreateJoins < ActiveRecord::Migration
  def self.up
    create_table :joins do |t|
    end
  end

  def self.down
    drop_table :joins
  end
end
