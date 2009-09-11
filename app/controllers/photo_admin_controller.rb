require 'RMagick'
include PhotoAdminHelper

class PhotoAdminController < ApplicationController
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
          :redirect_to => { :action => :list }

  def new
    @photo = Photo.new
    @place_to_photo_link = PhotosPlaces.new 
  end
  
  def index
    list
    render :action => 'list'
  end
  
  def show
    @photo = Photo.find(params[:id])
    @places = Place.find(:all, :order=>"id") 
  end

  
  def get
    @image_data = Photo.find(params[:id])
    @image = @image_data.binary_data
    send_data(@image, :type     => @image_data.content_type,
            :filename => @image_data.filename,
            :disposition => 'inline')
  end

  def thumbnail
    @image_data = Photo.find(params[:id])
    @image = @image_data.thumbnail_data
    send_data(@image, :type     => @image_data.content_type,
            :filename => @image_data.filename,
            :disposition => 'inline')
  end

  def list
    @photos = Photo.paginate :page => params[:page], :per_page => 10
  end

  def create

    if params[:photo][:image_file].blank? 
      flash[:notice] = 'No image specified'
      render :action => 'new'
      return
    end
    
    @photo = Photo.new(params[:photo])

    if image_is_too_large(params[:photo])
      flash[:notice] = 'Image is too large, max is 2 Megabytes'
      render :action => 'new'
      return
    end

    @photo.thumbnail_data = make_thumbnail(@photo.binary_data)
    
    if @photo.save
      link_photo_to_place_id( @photo.id, params[:photos_places][:place_id] )
      flash[:notice] = 'Photo was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
    
  end

  def edit
    @photo = Photo.find(params[:id])
    @places = Place.find(:all, :order=>"id") 
    @place_to_photo_link = PhotosPlaces.find(:first, :conditions => "photo_id = " + @photo.id.to_s)
    @selected_place = Place.find(:first, :conditions => "id = " + @place_to_photo_link['place_id'].to_s) 
  end

  def update
    @photo = Photo.find(params[:photo][:id])
    @selected_place = Place.find(params[:photos_places][:place_id]) 
    @place_to_photo_link = PhotosPlaces.find(:first, :conditions => "photo_id = " + @photo.id.to_s)
    update_photo_link_to_place_id(@photo.id.to_s, @place_to_photo_link['place_id'], params[:photos_places][:place_id])
    
    if @photo.update_attributes(params[:photo])
      flash[:notice] = 'Photo was successfully updated.'
      redirect_to :action => 'show', :id => @photo
    else
      render :action => 'edit'
    end
  end

  def destroy
    Photo.find(params[:id]).destroy
    remove_link_from_photo_to_place_id (params[:id])
    redirect_to :action => 'list'
  end
end
