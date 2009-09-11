require 'ftools'

class CategoriesController < ApplicationController

  @@results_per_page = 10

  def index
    list
    render :action => 'list'
  end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :action => :list }
  
  def list
    @categories = Category.paginate :page => params[:page], :per_page => @@results_per_page
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
    
    fix_missing_images
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      create_todo_image @category.id.to_s
      flash[:notice] = 'Category was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
      redirect_to :action => 'show', :id => @category
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    Category.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  private
  
  def create_todo_image id
    cwd = RAILS_ROOT + '/public/images/mapicons/'
    File.copy(cwd + 'todo.png', cwd + id + '.png')
  end
  
  def fix_missing_images
    Category.find(:all).each{ |cat| 
      if not File.exist?(RAILS_ROOT + '/public/images/mapicons/' + cat.id.to_s + ".png")
        puts 'Creating missing image for ' + cat.id.to_s
        create_todo_image cat.id.to_s
      end
    }
  end
  
end
