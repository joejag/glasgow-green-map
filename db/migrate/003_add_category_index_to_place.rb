class AddCategoryIndexToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, "category_id", :integer
    add_index :places, ["category_id"]
  end
  
  def self.down
  #  remove_index :places, column => :category_id
    remove_column :places, :category_id
  end
end
