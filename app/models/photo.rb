class Photo < ActiveRecord::Base

  # Tutorial: http://railsforum.com/viewtopic.php?id=4642
  belongs_to :place

  def image_file=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
  
end
