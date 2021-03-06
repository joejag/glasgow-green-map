class EventsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @events = Event.paginate :page => params[:page], :per_page => 10
  end

  def show
    @events = Events.find(params[:id])
  end

  def new
    @events = Events.new
  end

  def create
    @events = Events.new(params[:events])
    if @events.save
      flash[:notice] = 'Events was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @events = Events.find(params[:id])
  end

  def update
    @events = Events.find(params[:id])
    if @events.update_attributes(params[:events])
      flash[:notice] = 'Events was successfully updated.'
      redirect_to :action => 'show', :id => @events
    else
      render :action => 'edit'
    end
  end

  def destroy
    Events.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
   
end
