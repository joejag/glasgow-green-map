include PhotoAdminHelper

class PlacesController < ApplicationController
  
  @@results_per_page = 10
  
  def self.results_per_page
    @@results_per_page
  end
  
  def index
    list_ajax
    render :action => 'list_ajax'
  end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :action => :list_ajax }
  
  def list
    @places = Place.paginate :page => params[:page], :per_page => @@results_per_page, :order => :category_id
    
    small_map_init
    
    @places.each_index do |index|
      @map.overlay_init(list_result_marker_init(@places[index], index))      
    end
    
    
    # Gather up longs and lats in an array so that we can zoom in on the places currently being shown
    @points_list = []
    @places.each {|x| @points_list << [x.latitude.to_s, x.longitude.to_s]}

    @map.center_zoom_on_points_init(@points_list)
  end
  
  def random
    @places = Place.find(:all, :order => "rand()", :limit => 10)
    
    small_map_init
    @places.each{|p| @map.overlay_init(marker_init(p)) }
  end
  
  def magic
    @postcode = params[:id] 
    small_map_init
  end  


  def listajaxian
    @tag = params[:locate][:tag]

    @tags = Tag.find(:all)
    @maped = Variable.new("map")
    context_init
    @postcode = Postcode.new(:postcode => params[:locate][:postcode], :longitude => params[:search_longitude], :latitude => params[:search_latitude])
    @miles = params[:locate][:miles]
    @location = Place.new(:longitude => @postcode.longitude, :latitude => @postcode.latitude)
    @locationlong = @postcode.longitude
    @locationlat = @postcode.latitude
    within_distance = @miles

    # figure out if this point is within x miles
    loccationSQl = "ROUND(ACOS(SIN(RADIANS(places.latitude))*SIN(RADIANS(#{@locationlat}))+COS(RADIANS(places.latitude))*COS(RADIANS(#{@locationlat}))*COS(RADIANS(#{@locationlong}-places.longitude)))*3958.754641,2)"
    
    @result = Place.paginate :page => params[:page], :per_page => @@results_per_page,
                                        :order => :distance,
                                        :joins => "INNER JOIN places_tags ON places.id = places_tags.place_id INNER JOIN tags ON places_tags.tag_id = tags.id",
                                        :conditions => ['tags.id = ? AND ' + loccationSQl + ' < ?', params[:locate][:tag].to_i, within_distance],
                                        :select => "places.*, " + loccationSQl + " AS distance"
   # Original code to make a location marker
    # list_location_marker_init @maped, @location, true

   
    @breadcrumbs = "Displaying <b>" + @result.size.to_s + "</b> Charity Shops within <b>" + params[:locate][:miles].to_s + "</b> miles of  <b>" + params[:locate][:postcode].to_s + "</b>"
  end

  def filtered_list_ajax
    @maped = Variable.new("map")
    @tags = Tag.find(:all)
    small_map_init
    context_init
  end

  def list_ajax
    @maped = Variable.new("map")
    @tags = Tag.find(:all)
    small_map_init
    context_init
  end
  
  def filtered_list
    # Parameters passed to this method:
    # :tag_id                         Tag ID(s) to filter by
    # :longsign, :loclongint,  :loclongfloat    longitude sign, integer and float part to search from
    # :latsign, :loclatint,  :loclatfloat       latitude sign, integer and float part to search from

    #Currently, we assume that all params are provided. The final search will be with a postcode, but I don't know how to convert postcode to lat and long yet
    # Construct the lat and long
    if params[:latsign] == "plus"
      @locationlat = params[:loclatint] + "." + params[:loclatfloat]
    else
      @locationlat = "-" + params[:loclatint] + "." + params[:loclatfloat]
    end

    if params[:longsign] == "plus"
      @locationlong = params[:loclongint] + "." + params[:loclongfloat]
    else
      @locationlong = "-" + params[:loclongint] + "." + params[:loclongfloat]
    end

    within_distance = 4
    
    # figure out if this point is within x miles
    loccationSQl = "ROUND(ACOS(SIN(RADIANS(places.latitude))*SIN(RADIANS(#{@locationlat}))+COS(RADIANS(places.latitude))*COS(RADIANS(#{@locationlat}))*COS(RADIANS(#{@locationlong}-places.longitude)))*3958.754641,2)"
    
    @places = Place.paginate :page => params[:page], :per_page => @@results_per_page,
                                        :order => :distance,
                                        :joins => "INNER JOIN places_tags ON places.id = places_tags.place_id INNER JOIN tags ON places_tags.tag_id = tags.id",
                                        :conditions => ['tags.id = ? AND ' + loccationSQl + ' < ?', params[:tag_id], within_distance],
                                        :select => "places.*, " + loccationSQl + " AS distance"
    
    small_map_init

    @places.each_index{|x| @map.overlay_init(list_result_marker_init(@places[x],x)) }
    
    # Gather up longs and lats in an array so that we can zoom in on the places currently being shown
    # For some reason JG can't yet figure out, if you put @points_list = [@locationlat.to_s, @locationlong.to_s] it doesn't work! So we need to declare a new array before we fill the array.
    @points_list = []
    @points_list << [@locationlat.to_s, @locationlong.to_s]
    @places.each {|x| @points_list << [x.latitude.to_s, x.longitude.to_s]}
    @map.center_zoom_on_points_init(@points_list)

    @location = Place.new
    @location.latitude = @locationlat.to_f
    @location.longitude =  @locationlong.to_f

    # Put a draggable marker at the point around which we are searching
    list_location_marker_init @map, @location, true
  end
  
  
  def list_by_tag_id
    if params[:id].nil?
      @places = Place.paginate :page => params[:page], :per_page => @@results_per_page, :order => :category_id
    else
      @places = Place.paginate :page => params[:page], :per_page => @@results_per_page, :order => :category_id, :joins => "INNER JOIN places_tags ON places.id = places_tags.place_id
      INNER JOIN tags ON places_tags.tag_id = tags.id", :conditions => ['tags.id = ? ', params[:id]], :select => "places.*"
      params[:id] = nil
    end
    
    small_map_init
    @places.each_index{|x| @map.overlay_init(list_result_marker_init(@places[x],x)) }
    
    # Gather up longs and lats in an array so that we can zoom in on the places currently being shown
    @pointslist = Array.new
    @places.each_index {|x| @pointslist[x] = [@places[x].latitude,@places[x].longitude]}
    
    # Messy! Only temporary - this will be tidied when I can figure out how. -JG
    @map.center_zoom_on_points_init(@pointslist[0],@pointslist[1],@pointslist[2],@pointslist[3],@pointslist[4],@pointslist[5],@pointslist[6],@pointslist[7],@pointslist[8],@pointslist[9])
  end

  def list_category
    if params[:category_id].nil?
      @places = Place.paginate :page => params[:page], :per_page => @@results_per_page, :order => :category_id
    else
      @places = Place.paginate :page => params[:page], :per_page => @@results_per_page, :conditions => ['category_id = ?', params[:category_id]]
      params[:category_id] = nil
    end
    
    small_map_init
    @places.each{|p| @map.overlay_init(marker_init(p)) }
  end
  
  def show
    small_map_init
    
    @place = Place.find(params[:id])
    @map.overlay_init(marker_init(@place))
    @map.center_zoom_init([@place.latitude, @place.longitude], 14)
  end
  
  def new
    small_map_init
    
    @place = Place.new
    @place.latitude = 55.8655
    @place.longitude = -4.26129
    @place_to_photo_link = PhotosPlaces.new 
    
    @tags = Tag.find(:all)
    
    movable_marker_init @map, @place, true
  end
  
  def create
    @place = Place.new(params[:place])
    @place.tags = Tag.find(params[:tag_ids]) if params[:tag_ids]
    if @place.save
      flash[:notice] = 'Place was successfully created.'
      redirect_to :action => 'show', :id => @place.id
    else
      @tags = Tag.find(:all)
      small_map_init
      movable_marker_init @map, @place, true
      render :action => 'new'
    end
  end
  
  def edit
    small_map_init
    @tags = Tag.find(:all)
    
    @place = Place.find(params[:id])
    movable_marker_init @map, @place, false
  end
  
  
  # Addin the photo update slowly
  def update
    @place = Place.find(params[:place][:id])
    @place.tags = Tag.find(params[:place][:tag_ids]) if params[:place][:tag_ids]   
          
 
          
     #Add-image
    if params[:photo][:image_file]
 
      @photo = Photo.new(params[:photo])
  
      if image_is_too_large(params[:photo])
        flash[:notice] = 'Image is too large, max is 2 Megabytes'
        render :action => 'edit'
        return
      end
  
      @photo.thumbnail_data = make_thumbnail(@photo.binary_data)
      
      if @photo.save
        link_photo_to_place_id( @photo.id, @place.id )         
      else
        flash[:notice] = 'Could not save photo'
        render :action => 'edit'
        return      
      end
    end
    #END-addImage
          
    
    if @place.update_attributes(params[:place])
      flash[:notice] = 'Place was successfully updated.'
      redirect_to :action => 'show', :id => @place.id
    else
      @tags = Tag.find(:all)
      small_map_init
      movable_marker_init @map, @place, false
      render :action => 'edit'
    end
  end
  
  def destroy
    Place.find(params[:id]).destroy
    redirect_to :controller => 'main', :action => 'list'
  end
  
end
