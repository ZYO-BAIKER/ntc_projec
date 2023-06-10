class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save!
      redirect_to attendances_path
    else
      render :new
    end
  end

  def show_date
    @date = Date.parse(params[:date])
    @attendances = Attendance.where(date: @date).order(:id)
  end

  def update_multiple
    @attendances = Attendance.where(id: params[:attendances].keys).order(:id)

    @attendances.each do |attendance|
      attendance.update!(attendance_params_for_update(attendance.id.to_s))
    end

    redirect_to attendances_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:date, :client, :construction_site, :work_content, :departure_time, :arrival_time, :remark, :vehicle, worker_ids: []).tap do |whitelisted|
      whitelisted[:worker_ids] = whitelisted[:worker_ids].reject(&:blank?)
    end
  end

  def attendance_params_for_update(id)
    params.require(:attendances).permit(id => [:client, :construction_site, :work_content, :departure_time, :arrival_time, :remark, :vehicle, worker_ids: []])[id]
  end
end
