class RenamePlaces < ActiveRecord::Migration
  def self.up
    remove_column :places, :postcode 
    
    add_column :places, :opening_hours, :string
    add_column :places, :contact, :string
    add_column :places, :telephone, :string
    add_column :places, :fax, :string
    add_column :places, :email, :string
    add_column :places, :website, :string
  end

  def self.down
    add_column :places, :postcode, :string
    
    remove_column :places, :opening_hours
    remove_column :places, :contact
    remove_column :places, :telephone
    remove_column :places, :fax
    remove_column :places, :email
    remove_column :places, :website
  end
end
