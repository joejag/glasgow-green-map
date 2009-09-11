# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

include MainHelper
include GoogleMapsHelper

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_deargreenplace_session_id'
  
  def small_map_init div = "map_div"
    @map = GMap.new(div)
    @map.control_init(:small_map => true)
    @map.center_zoom_init([55.8655, -4.26129],14)
    
    geocoding_init
    icons_init
    context_init
  end
  
  def large_map_init div = "map_div"
    @map = GMap.new(div)
    @map.control_init(:large_map => true, :map_type => true, :overview_map => true)
    @map.center_zoom_init([55.8655, -4.26129],12)
    
    geocoding_init
    icons_init
    context_init
  end
  
  private
  
  # When deployed to Apache we need to know the app context, i.e. http://host/THISBIT/
  def include_app_context url
    url_for(:controller => url)
  end
  
  def context_init
    @context = url_for({:controller => ".", :trailing_slash => true})
  end
  
  def zoom_according_to_distance_covered miles
    return 14 - (miles.to_i > 3 ? 3 : miles.to_i)
  end
  
end
