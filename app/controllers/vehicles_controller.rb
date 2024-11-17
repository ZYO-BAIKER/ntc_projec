class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
    @vehicles = Vehicle.order(:vehicle_type, :created_at)
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.valid?
      @vehicle.save!
      redirect_to new_vehicle_path
    else
      render :new
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy!
    redirect_to new_vehicle_path
  end

  private

    def vehicle_params
      params.require(:vehicle).permit(:number, :vehicle_type)
    end
end
