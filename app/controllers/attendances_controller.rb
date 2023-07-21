class AttendancesController < ApplicationController
  before_action :set_date_and_attendances, only: [:new, :show_date]

  include WorkersHelper
  include VehiclesHelper

  def new
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
      failed_attendances = failed_attendances(@attendance_form.attendances)
      @attendance_form.attendances = @attendances + failed_attendances
      @rendered_from_create = true
      render :new
    end
  end

  def show_date
  end

  def update_multiple
    @attendances = Attendance.where(id: params[:attendances].keys)
    @attendances.each do |attendance|
      if destroy_requested_for?(attendance)
        attendance.destroy!
      else
        attendance.update!(params_for_attendanc(attendance.id.to_s))
      end
    end

    redirect_to attendances_path
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.record.errors.full_messages
    @date = @attendances.first.date
    @rendered_from_create = true
    render :show_date
  end

  private

    def attendance_form_params
      params.require(:attendance_form).permit(
        attendances_attributes: [:date, :client, :construction_site, :work_content, :departure_time, :arrival_time, :worker_count, :remark, :vehicle,
                                 { worker_ids: [], vehicle_ids: [] }],
      ).tap do |whitelisted|
        whitelisted[:attendances_attributes].each do |_, attributes|
          attributes[:worker_ids] = (attributes[:worker_ids] || []).reject(&:blank?)
          attributes[:vehicle_ids] = (attributes[:vehicle_ids] || []).reject(&:blank?)
        end
      end
    end

    def params_for_attendanc(id)
      params.require(:attendances).permit(id => [:client, :construction_site, :work_content, :departure_time, :arrival_time, :worker_count, :remark, :vehicle, :delete, {
        worker_ids: [], vehicle_ids: []
      }])[id]
    end

    def set_date_and_attendances
      @date = Date.parse(params[:date])
      @attendances = Attendance.where(date: @date).order(:id)
    end

    def failed_attendances(attendances)
      attendances.reject {|a| @attendances.include?(a) }
    end

    def destroy_requested_for?(attendance)
      params[:attendances][attendance.id.to_s][:_destroy] == "1"
    end
end
