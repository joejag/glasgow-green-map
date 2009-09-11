class PostcodesController < ApplicationController
  def index
    list
    render :action => 'list'
  end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :action => :list }
  
  def fetch
    @postcode = Postcode.find(:first, :conditions => [ "postcode = ?", params[:id]])
    
    if @postcode.nil?
      @postcode = Postcode.new
    end
  end
  
  def auto
    small_map_init
    
    places = Place.find(:all)
    @postcodes = []
    places.each do |p| 
      if(p.latitude == nil and p.postcode != nil)
        @postcodes << p.postcode
      end
    end
  end
  
  def copy
    places = Place.find(:all)
    places.each do |p| 
      if(p.latitude == nil and p.postcode != nil)
        post = Postcode.find(:first, :conditions => { :postcode => p.postcode })
        if !post.nil?
          p.latitude = post.latitude
          p.longitude = post.longitude
          p.save
        end
      end
    end
  end
  
  def list
    @postcodes = Postcode.paginate :page => params[:page], :per_page => 200
  end
  
  def show
    @postcode = Postcode.find(params[:id])
  end
  
  def new
    @postcode = Postcode.new
  end
  
  def create
    @postcode = Postcode.new(params[:postcode])
    
    #puts "Postcode " + @postcode.postcode.to_s + " Longitude: " + @postcode.longitude.to_s + " lat: " + @postcode.latitude.to_s
    
    if @postcode.save
      #puts "Postcode " + @postcode.postcode.to_s + " Longitude: " + @postcode.longitude.to_s + " lat: " + @postcode.latitude.to_s
      flash[:notice] = 'Postcode was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @postcode = Postcode.find(params[:id])
  end
  
  def update
    @postcode = Postcode.find(params[:id])
    if @postcode.update_attributes(params[:postcode])
      flash[:notice] = 'Postcode was successfully updated.'
      redirect_to :action => 'show', :id => @postcode
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    Postcode.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
