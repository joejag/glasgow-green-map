class AddForiegnKeys < ActiveRecord::Migration
  def self.up
    add_foreign_key :places, :category_id, :categories, :id, :name => "places_fk_cat"
    
    # SEE: http://www.redhillonrails.org/#redhillonrails_core
    # Normally create :customers
    # t.foreign_key :customer_id, :customers, :id, :name => "places_fk_cat"
  end

  def self.down
    remove_foreign_key :places, "places_fk_cat"
  end
end
