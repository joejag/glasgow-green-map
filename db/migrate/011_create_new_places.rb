class CreateNewPlaces < ActiveRecord::Migration
  def self.up    
    remove_column :places, :address
    remove_column :places, :fax
    
    add_column :places, :address_1, :string
    add_column :places, :address_2, :string
    add_column :places, :address_3, :string
    add_column :places, :postcode, :string
    add_column :places, :town, :string
    
    rename_column :places, :opening_hours, :opening_times
    rename_column :places, :website, :url
  end
  
  def self.down
    add_column :places, :address, :string
    add_column :places, :fax, :string
    
    remove_column :places, :address_1
    remove_column :places, :address_2
    remove_column :places, :address_3
    remove_column :places, :postcode
    remove_column :places, :town
    
    rename_column :places, :opening_times, :opening_hours
    rename_column :places, :url, :website
  end
end
