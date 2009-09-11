class AddSampleCategories < ActiveRecord::Migration
  def self.up
    Category.create(:name => 'Category 1', :description => 'sample text')
    Category.create(:name => 'Category 2', :description => 'sample text')
    Category.create(:name => 'Category 3', :description => 'sample text')
  end

  def self.down
    Category.delete(Category.find(:all, :conditions => { :name => "Category 1" }))
    Category.delete(Category.find(:all, :conditions => { :name => "Category 2" }))
    Category.delete(Category.find(:all, :conditions => { :name => "Category 3" }))
  end
end
