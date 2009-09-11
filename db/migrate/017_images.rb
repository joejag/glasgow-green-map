class Images < ActiveRecord::Migration
  def self.up
    create_table "images" do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :extension, :string
    end
  end

  def self.down
	  drop_table "images"
  end
end
