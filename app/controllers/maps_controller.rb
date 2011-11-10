require 'digest'
class MapsController < ApplicationController
  layout 'application', :except => :index
  before_filter   :authenticate, :except => [:index]
  # GET /maps
  # GET /maps.xml
  
  def index
  # == show the source and destinations
  #OPTIMIZE
    @maps = Map.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maps }
    end
  end

  # GET /maps/1
  # GET /maps/1.xml
  def show
    #TODO
    @map = Map.find(params[:id])
    @map2=Map.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @map }
    end
  end

  # GET /maps/new
  # GET /maps/new.xml
  def new
    #TODO
    @map = Map.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @map }
    end
  end

  # GET /maps/1/edit
  def edit
    #TODO cool2
    @map = Map.find(params[:id])
  end

  # POST /maps
  # POST /maps.xml
  def create
    #FIXME check
    @map = Map.new(params[:map])

    respond_to do |format|
      if @map.save
        format.html { redirect_to(@map, :notice => 'Map was successfully created.') }
        format.xml  { render :xml => @map, :status => :created, :location => @map }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @map.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /maps/1
  # PUT /maps/1.xml
  def update
    #TODO cool2
    @map = Map.find(params[:id])

    respond_to do |format|
      if @map.update_attributes(params[:map])
        format.html { redirect_to(@map, :notice => 'Map was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @map.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.xml
  def destroy
    @map = Map.find(params[:id])
    @map.destroy

    respond_to do |format|
      format.html { redirect_to(maps_url) }
      format.xml  { head :ok }
    end
  end
  protected

#def authenticate
#  authenticate_or_request_with_http_basic do |username, password|
#    username == "root" && password == "cochin"
#  end
#end




 def authenticate
   authenticate_or_request_with_http_basic('Administration') do |username, password|
     md5_of_password = Digest::MD5.hexdigest(password)
     username == 'root' && md5_of_password == 'bfc286df450f68ed12bf0cbe93640f23'
   end
 end

end
