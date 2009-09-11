module PhotoAdminHelper
  
  def places_for_select
    Place.all.collect { |m| [m.name + " - " + m.address_1, m.id] }
  end

  def make_thumbnail(img_binary)  
    pic = Magick::Image.from_blob(img_binary).first
    if pic.columns > 100 or pic.rows > 100
      height = (100.to_f / pic.columns.to_f) * pic.rows.to_f
      pic = pic.scale(100, height)
      return pic.to_blob
    else
      return img_binary
    end
  end  
  
  def image_is_too_large(photo_binary)
    return Photo.new(photo_binary).binary_data.size > 2.megabytes
  end
  
  
  # !!Hack!!
  # Manually updating the photos_places join table because the relationship
  # between does not seem to be specified properly. 
  # This was the only way I could update it when I should be using either: 
  #
  # @photos_places.update_attribute :place_id, '120' 
  # or @photos_places.update_attributes :place_id => '120'
  # or @photos_places.place_id = '120' then @photos_places.save
  #
  def update_photo_link_to_place_id(photo_id, old_place_id, new_place_id)
    sql = ActiveRecord::Base.connection();
    sql.execute "SET autocommit=0";
    sql.begin_db_transaction
    value =
    sql.update "UPDATE photos_places SET place_id=#{new_place_id}  WHERE place_id=#{old_place_id} AND photo_id=#{photo_id}";
    sql.commit_db_transaction
 
    value;
  end   

  def link_photo_to_place_id (photo_id, place_id)
    sql = ActiveRecord::Base.connection();
    sql.execute "SET autocommit=0";
    sql.begin_db_transaction
    value =
    sql.update "INSERT INTO photos_places (photo_id , place_id) VALUES ( #{photo_id}, #{place_id} );";
    sql.commit_db_transaction
    value;
  end

  def remove_link_from_photo_to_place_id (photo_id)
    sql = ActiveRecord::Base.connection();
    sql.execute "SET autocommit=0";
    sql.begin_db_transaction
    value =
    sql.update "DELETE FROM photos_places WHERE photo_id=#{photo_id};";
    sql.commit_db_transaction
    value;
  end
  
  #Expects format: totalPhotoNo_shopPhotoNo_shopName_postcode.format
  def  get_tokens_from_photo_filename(filename)
     parts = filename.split('_')
     fileNameBits = { 
      :totalPhotoNo => parts[0],
      :shopPhotoNo => parts[1],
      :shopName => parts[2],
      :postcode => parts[3].split('.')[0],
      :format => parts[3].split('.')[1] 
      }  

     return fileNameBits
 end
 
  def new_photo_with_standard_filename(fileNameInExpectedFormat, dir)
    tokenisedfileName = get_tokens_from_photo_filename(fileNameInExpectedFormat)
    Photo.last.nil? ? (id = 0) : (id = Photo.last.id)
    puts "Inserting Photo ID=[" + id.to_s + "]  Name=[" + fileNameInExpectedFormat + "]"
    
    photo = Photo.create(
        :id => id+= 1,
        :description => 'The Shop front',
        :content_type => tokenisedfileName[:format],
        :filename => fileNameInExpectedFormat.to_s,
        :binary_data => File.read( dir + fileNameInExpectedFormat),
        :thumbnail_data => make_thumbnail(File.read( dir + fileNameInExpectedFormat))
    )  
     
    return photo.id
 end
 

end


