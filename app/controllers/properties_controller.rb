class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update]

  def index
  @properties = Property.all
  end

  def new
    @property = Property.new
    2.times {@property.nearest_stations.build}
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new
    end
  end

  def show
    @nearest_stations = @property.nearest_stations
  end

  def edit
  end

  def update
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :remarks, nearest_stations_attributes:[
      :rail_line_name, :station_name,  :property_id, :walk])
  end
end
