class PhotosPlaces < ActiveRecord::Base
  belongs_to :place_id, :class_name => 'place', :foreign_key => 'place_id'
  belongs_to :photo_id, :class_name => 'photo', :foreign_key => 'photo_id'
end
