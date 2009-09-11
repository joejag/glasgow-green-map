class AddRealCategories < ActiveRecord::Migration
  def self.up
    Category.delete(Category.find(:all, :conditions => { :name => "Category 1" }))
    Category.delete(Category.find(:all, :conditions => { :name => "Category 2" }))
    Category.delete(Category.find(:all, :conditions => { :name => "Category 3" }))
    
    Category.create(:name => 'Charity Shop', :description => 'Charity Shop')
    Category.create(:name => 'Environmental Organisation', :description => 'Org for environment')
  end

  def self.down
    Category.delete(Category.find(:all, :conditions => { :name => "Charity Shop" }))
    Category.delete(Category.find(:all, :conditions => { :name => "Environmental Organisation" }))
    
    Category.create(:name => 'Category 1', :description => 'sample text')
    Category.create(:name => 'Category 2', :description => 'sample text')
    Category.create(:name => 'Category 3', :description => 'sample text')
  end
end
