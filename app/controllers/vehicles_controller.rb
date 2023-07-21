class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.valid?
      @vehicle.save!
      redirect_to attendances_path
    else
      render :new
    end
  end

  private

    def vehicle_params
      params.require(:vehicle).permit(:number, :vehicle_type)
    end
end
