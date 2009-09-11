require File.dirname(__FILE__) + '/../../test_helper'

class PostcodesHelperTest < Test::Unit::TestCase
  include ActionView::Helpers::PostcodesHelper
  include ApplicationHelper
    
  fixtures :postcodes
  
  def test_cleaning_postcode_input 
    assert_equal 'g40 1hw', clean('g401hw');    
  end
  
  def test_adding_a_space_to_postcode
    assert_equal 'g40 1hw', clean('g401hw');    
    assert_equal 'g41 3ay', clean('g41 3ay');    
  end
  
  
end