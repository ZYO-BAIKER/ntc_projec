class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.valid?
      @worker.save!
      redirect_to attendances_path
    else
      render :new
    end
  end

  private

    def worker_params
      params.require(:worker).permit(:name, :group)
    end
end
