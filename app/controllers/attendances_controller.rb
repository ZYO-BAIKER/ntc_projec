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
    begin
      @attendances = Attendance.where(id: params[:attendances].keys)
      @attendances.each do |attendance|
        if params[:attendances][attendance.id.to_s][:_destroy] == '1'
          attendance.destroy!
        else
          attendance.update!(attendance_params_for_update(attendance.id.to_s))
        end
      end

      redirect_to attendances_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.record.errors.full_messages
      render :show_date
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:date, :client, :construction_site, :work_content, :departure_time, :arrival_time, :remark, :vehicle, worker_ids: []).tap do |whitelisted|
      whitelisted[:worker_ids] = whitelisted[:worker_ids].reject(&:blank?)
    end
  end

  def attendance_params_for_update(id)
    params.require(:attendances).permit(id => [:client, :construction_site, :work_content, :departure_time, :arrival_time, :remark, :vehicle, :delete, worker_ids: []])[id]
  end
end
