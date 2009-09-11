require 'test_helper'

class PhotoAdminHelperTest < Test::Unit::TestCase
  include PhotoAdminHelper
  
  def test_get_tokens_from_photo_filename
    filename = "001_1_debra_g13qx.jpg"
    tokenCollection = get_tokens_from_photo_filename(filename)
            
    assert_equal "001", tokenCollection[:totalPhotoNo];    
    assert_equal "1", tokenCollection[:shopPhotoNo];    
    assert_equal 'debra', tokenCollection[:shopName];    
    assert_equal 'g13qx', tokenCollection[:postcode];    
    assert_equal 'jpg', tokenCollection[:format];    
  end
  
  
  
end