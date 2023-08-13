class WorkersController < ApplicationController
  def new
    @worker = Worker.new
    @workers = Worker.all
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.valid?
      @worker.save!
      redirect_to new_worker_path
    else
      render :new
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy!
    redirect_to new_worker_path
  end

  private

    def worker_params
      params.require(:worker).permit(:name, :group)
    end
end
