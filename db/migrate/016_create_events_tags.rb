class CreateEventsTags < ActiveRecord::Migration
  def self.up
  create_table :events_tags, :id => false do |table|
      table.column :event_id, :integer
      table.column :tag_id, :integer
    end
  end

  def self.down
    drop_table :events_tags
  end
end
