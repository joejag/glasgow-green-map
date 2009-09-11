class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.column :author, :string
      t.column :title, :string
      t.column :body, :text
      t.column :created_on, :datetime
    end
  end
  
  def self.down
    drop_table :articles
  end
end
