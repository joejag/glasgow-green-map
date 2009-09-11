require 'active_record/fixtures'
require 'RMagick'
include PhotoAdminHelper


#
# This Loads Shop photos from a specified directory
# Each of the files are expected to be in the standard format.
#
# File name format:
#   totalPhotoNo_shopPhotoNo_camelCasedName__postcode_format
#
class LoadPhotosData < ActiveRecord::Migration
  
  @photos_dir = "/location/of/photos/directory/"
  @escapedSpacesInName = "REPLACE(name, ' ', '')"
  @escapedCommasInName = "REPLACE( "+ @escapedSpacesInName + ", ',', '') "
  @escapedDotsInName = "REPLACE( "+ @escapedCommasInName + ", '.', '') "
  
  def self.up
    Dir.new(@photos_dir).entries.each do |photoFile|
      ignored_file_type = ( photoFile.to_s == "." or photoFile.to_s == ".." or photoFile.to_s == ".DSStore" )

      unless ignored_file_type
        id = new_photo_with_standard_filename( photoFile, @photos_dir)
        tokenisedfileName = get_tokens_from_photo_filename(photoFile)
        place = Place.find(:first, :conditions => ["Upper(Replace(postcode, ' ', '') = ? ) AND LOWER( "+ @escapedDotsInName + "  LIKE ? ) ", tokenisedfileName[:postcode].capitalize, '%'+tokenisedfileName[:shopName].downcase+'%' ] )            
        link_photo_to_place_id(id, place.id)
      end
    end
  end

  def self.down
    Photo.delete_all
    PhotosPlaces.delete_all
  end
  
end