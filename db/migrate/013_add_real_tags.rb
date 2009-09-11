class AddRealTags < ActiveRecord::Migration
  def self.up
    Tag.new(:name => "Volunteering opportunities").save
    Tag.new(:name => "Textiles").save
    Tag.new(:name => "Clothing").save
    Tag.new(:name => "Books/Music").save
    Tag.new(:name => "Bric-a-brac").save
    Tag.new(:name => "Baby/Kids Wear").save
    Tag.new(:name => "Small Electrical").save
    Tag.new(:name => "Large Electrical").save
    Tag.new(:name => "Small Furniture").save
    Tag.new(:name => "Large Furniture").save
    Tag.new(:name => "Carpet").save
    Tag.new(:name => "Bikes").save
    Tag.new(:name => "IT Equipment").save
    Tag.new(:name => "Ink Cartridges").save
    Tag.new(:name => "Wood").save
    Tag.new(:name => "Mobile Phones").save
    Tag.new(:name => "Environmental Organisation").save
  end
  
  def self.down
    Tag.delete(Tag.find(:all, :conditions => { :name => "Charity Shop" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Volunteering opportunities" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Textiles" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Clothing" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Books/Music" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Bric-a-brac" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Baby/Kids Wear" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Small Electrical" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Large Electrical" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Small Furniture" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Large Furniture" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Carpet" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Bikes" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "IT Equipment" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Ink Cartridges" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Wood" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Mobile Phones" }))
    Tag.delete(Tag.find(:all, :conditions => { :name => "Environmental Organisation" }))
  end
end
