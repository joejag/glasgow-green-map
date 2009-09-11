class Events < ActiveRecord::Base
  
  validates_presence_of :recurring_type, :contact_name, :contact_no, :name, :address, :postcode, :about
  validates_numericality_of :recurring_type, :contact_no
  
  
  def self.overview_columns
     @overview_columns ||= columns.reject { |c| c.primary || c.name =~ /(_id|_count|longitude|latitude|added_by|updated_at|created_at|recurring_type|finish_date|all_day_event|contact_name|contact_no|about|postcode)$/ || c.name == inheritance_column }
  end
  
  def self.event_details_columns
     @event_details_columns ||= columns.reject { |c| c.primary || c.name =~ /(_id|_count|longitude|latitude|added_by|updated_at|created_at|recurring_type|finish_date|all_day_event|contact_name|contact_no|about|postcode)$/ || c.name == inheritance_column }
  end


end
