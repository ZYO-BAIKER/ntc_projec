class AttendancesController < ApplicationController
  include WorkersHelper
  include VehiclesHelper

  def new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @attendances = Attendance.where(date: @date).order(:id)
    @attendance_form = AttendanceForm.new
    @attendance_form.attendances.concat(@attendances)
    @attendance_form.attendances << Attendance.new(date: @date)
  end

  def create_multiple
    @attendance_form = AttendanceForm.new(attendance_form_params)
    if @attendance_form.save
      date = @attendance_form.attendances[0].date
      redirect_to show_date_attendances_path(date: date)
    else
      @date = @attendance_form.attendances.first.date
      @attendances = Attendance.where(date: @date).order(:id)
      failed_attendances = @attendance_form.attendances.reject { |a| @attendances.include?(a) }
      @attendance_form.attendances = @attendances + failed_attendances
      @rendered_from_create = true
      render :new
    end
  end

  def show_date
    @date = Date.parse(params[:date])
    @attendances = Attendance.where(date: @date).order(:id)
  end

  def update_multiple
    @attendances = Attendance.where(id: params[:attendances].keys)
    @attendances.each do |attendance|
      if params[:attendances][attendance.id.to_s][:_destroy] == "1"
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

  private

    def attendance_form_params
      params.require(:attendance_form).permit(
        attendances_attributes: [:date, :client, :construction_site, :work_content, :departure_time, :arrival_time, :remark, :vehicle,
                                 { worker_ids: [], vehicle_ids: [] }],
      ).tap do |whitelisted|
        whitelisted[:attendances_attributes].each do |_, attributes|
          attributes[:worker_ids] = (attributes[:worker_ids] || []).reject(&:blank?)
          attributes[:vehicle_ids] = (attributes[:vehicle_ids] || []).reject(&:blank?)
        end
      end
    end

    def attendance_params_for_update(id)
      params.require(:attendances).permit(id => [:client, :construction_site, :work_content, :departure_time, :arrival_time, :remark, :vehicle, :delete, {
        worker_ids: [], vehicle_ids: []
      }])[id]
    end
end
