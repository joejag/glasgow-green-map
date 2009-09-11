class MainController < ApplicationController

  def list
    @places = Place.find(:all)
    large_map_init
    @places.each{|p| @map.overlay_init(marker_init(p)) }
  end

  def list_by_letter
    @letter = params[:letter]

    if(@letter != "T")
      @places = Place.find(:all, :conditions => [ "name LIKE ? OR name LIKE ?", @letter + '%', 'The ' + @letter + '%'])
    else
      @places = Place.find(:all, :conditions => [ "name LIKE ? AND name NOT LIKE ?", @letter + '%', 'The%'])
    end

    small_map_init
    @places.each{|p| @map.overlay_init(marker_init(p)) }
  end

  def index
    small_map_init "map_div_main"

    @article_pages, @articles = Article.paginate :page => 10

    @maped = Variable.new("map")
    @tags = Tag.find(:all)
  end

  def index_old
    if(not params[:start_with].nil?)
      searching_for_tag = params[:start_with].to_s
      places_temp = Place.locations_in_range(Place.new(:latitude => 55.8655, :longitude => -4.26129), 10)

      @places = []

      places_temp.each do |p|
        p.tags.each do |t|
          if(t.name.to_s == searching_for_tag)
            @places << p
          end
        end
      end
    else
      @places = Place.locations_in_range(Place.new(:latitude => 55.8655, :longitude => -4.26129), 1.5)
    end

    small_map_init "map_div_main"
    @places.each{|p| @map.overlay_init(marker_init(p)) }

    @articles = Article.paginate :page => params[:page], :per_page => 10

    @maped = Variable.new("map")
    @tags = Tag.find(:all)
  end

  def within
    @postcode = params[:postcode]
    ActionView::Helpers::PostcodesHelper.clean(@postcode)
    location = Place.new(:longitude => params[:longitude], :latitude => params[:latitude])

    @miles = params[:miles]
    @places = Place.locations_in_range(location, @miles)

    large_map_init
    @map.center_zoom_init([location.latitude, location.longitude], zoom_according_to_distance_covered(@miles))
    @places.each{|p| @map.overlay_init(marker_init(p)) }
  end

  def rss
    @articles = Article.find(:all, :order => "id DESC")
    render_without_layout
    @headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def ajaxian
    if(params[:zoom_level] == "")
      @zoom_level = zoom_according_to_distance_covered(params[:locate][:miles])
    else
      @zoom_level = params[:zoom_level]
    end

    @maped = Variable.new("map")
    context_init
    @postcode = Postcode.new(:postcode => params[:locate][:postcode], :longitude => params[:search_longitude], :latitude => params[:search_latitude])
    @miles = params[:locate][:miles]
    
    location = Place.new(:longitude => @postcode.longitude, :latitude => @postcode.latitude)

    places = Place.locations_in_range(location, params[:locate][:miles])

    @result = []
    searching_for_tag = params[:locate][:tag].to_s

    if(searching_for_tag == "")
      @result = places
    end

    places.each do |p|
      p.tags.each do |t|
        if(t.id.to_s == searching_for_tag)
          @result << p
        end
      end
    end
    
    
    is_default = params[:locate][:defaultToCenter].to_s
    
    
    if(is_default == 'true')
       @breadcrumbs = "Could not find your search and so displaying Glasgow City Center postcode: <b>" + params[:locate][:postcode].to_s + "</b> with <b>" + @result.size.to_s + "</b> Charity Shops within <b>" + params[:locate][:miles].to_s + "</b> miles."
    else    
      @breadcrumbs = "Displaying <b>" + @result.size.to_s + "</b> Charity Shops within <b>" + params[:locate][:miles].to_s + "</b> miles of  <b>" + params[:locate][:postcode].to_s + "</b>"
    end

    
  end

end
