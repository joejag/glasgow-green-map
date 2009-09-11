class CreateEvents < ActiveRecord::Migration
  
  def self.up
   create_table "events" do |table|
    table.column "name", :string
    table.column "address", :string
    table.column "postcode", :string
    table.column "about", :text
    table.column "longitude", :float
    table.column "latitude", :float
    
    table.column "start_date", :datetime
    table.column "finish_date", :datetime
    
    table.column "added_by", :string
    table.column "created_at", :datetime
    table.column "updated_at", :datetime

    table.column "contact_name", :string
    table.column "contact_no", :integer
    table.column "contact_url", :string
    
    table.column "all_day_event", :boolean
    
    table.column "recurring_type", :integer
   end
  end

  def self.down
   drop_table :events
  end
  
end
