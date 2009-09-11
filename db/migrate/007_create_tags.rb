class CreateTags < ActiveRecord::Migration
  def self.up
  create_table :tags do |t|
      t.column "name", :string
      t.column "description", :string
    end
  end

  def self.down
    drop_table :tags
  end
end
