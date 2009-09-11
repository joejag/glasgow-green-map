module GoogleMapsHelper
  
  def marker_init place
    GMarker.new([place.latitude, place.longitude],
                :info_window => create_info_text(place), 
    :title => place.name, 
    :icon => Variable.new("icon_" + place.category_id.to_s))
  end

  def list_result_marker_init place, result_number
    GMarker.new([place.latitude, place.longitude],
                :info_window => create_info_text(place), 
    :title => place.name, 
    :icon => Variable.new("result_icon_" + (result_number+1).to_s))
  end


  def location_marker_create_ajax_init place
    GMarker.new([place.latitude, place.longitude], 
                          :draggable => true, 
                          :icon =>  Variable.new("icon_new"))
  end


  def list_location_marker_init map, place, use_new_icon
    gmarker = GMarker.new([place.latitude, place.longitude], 
                          :draggable => true, 
                          :icon =>  use_new_icon ? Variable.new("icon_new") : Variable.new("icon_" + place.category.id.to_s))

    map.declare_global_init(gmarker, 'marker1')
    map.overlay_init(gmarker)
    
    map.event_init(gmarker, :dragend, "function () 
     { point = marker1.getPoint();  
       map.setCenter(point); 
       map.savePosition();
       document.forms[0].place_longitude.value = point.lng();
       document.forms[0].place_latitude.value = point.lat();
     }")
  end
  
  
  def movable_marker_init map, place, use_new_icon
    gmarker = GMarker.new([place.latitude, place.longitude], 
                          :draggable => true, 
                          :icon =>  use_new_icon ? Variable.new("icon_new") : Variable.new("icon_" + place.category.id.to_s))
    map.center_zoom_init([place.latitude, place.longitude],12)
    map.declare_global_init(gmarker, 'marker1')
    map.overlay_init(gmarker)
    
    map.event_init(gmarker, :dragend, "function () 
     { point = marker1.getPoint();  
       map.setCenter(point); 
       map.savePosition();
       document.forms[0].place_longitude.value = point.lng();
       document.forms[0].place_latitude.value = point.lat();
     }")
  end
  
  def icons_init 
    # Create icon for each category
    Category.find(:all).each{ |cat|
      @map.icon_global_init(icon_init(cat.id.to_s), "icon_" + cat.id.to_s)
    }
    
    # Create icon for each of the listing results
    @results_per_page = PlacesController.results_per_page
    @results_per_page += 1
    n = 1
    while n < @results_per_page
      @map.icon_global_init(icon_init("result_icon_" + n.to_s), "result_icon_" + n.to_s)
      n = n + 1
    end
    
    # Create New Icon
    @map.icon_global_init(icon_init("new"), "icon_new")
  end
  
  def icon_init image_url
    GIcon.new(:shadow => include_app_context("/images/mapicons/shadow.png"), 
    :image => include_app_context("/images/mapicons/" + image_url + ".png"), 
    :icon_size => GSize.new(25,40), 
    :icon_anchor => GPoint.new(0,40), 
    :info_window_anchor => GPoint.new(9,2))    
  end
  
  def geocoding_init
    @map.record_global_init( "var geocoder = new GClientGeocoder();")
   # @map.record_global_init( "geocoder.setBaseCountryCode('GB')")
  end
  
  
end