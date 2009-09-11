require File.dirname(__FILE__) + '/../test_helper'

class PlaceTest < Test::Unit::TestCase
  fixtures :places

  def test_two_places_exist
    places = Place.find(:all)
    assert_equal 2, places.size
    
    place = Place.find(1)
    assert_equal "test place 1", place.name
  end

  def test_find_distance_between_points
    place_one = Place.find(1)
    place_two = Place.find(2)
    
    distance = place_one.miles_to(place_two)
    assert_equal 3, distance
  end
  
  def test_find_points_in_area
    place_one = Place.find(1)
    place_two = Place.find(2)
    
    places = place_one.locations_in_range(3)
    assert_equal 2, places.size
    assert_equal place_two, places[1]
    
    places = place_one.locations_in_range(2)
    assert_equal 1, places.size
  end
  
  def test_find_points_from_point
    p = Place.new(:longitude => 55.8906, :latitude => -4.21871)
  
    places = Place.locations_in_range(p,4)
    assert_equal 1, places.size
    
    places = Place.locations_in_range(p,5)
    assert_equal 2, places.size
  end
  
  def test_search_with_spaces_in_postcode
    p = Place.new(:longitude => 55.8906, :latitude => -4.21871)
  
    places = Place.locations_in_range(p,4)
    assert_equal 1, places.size
    
    places = Place.locations_in_range(p,5)
    assert_equal 2, places.size
  end

end
