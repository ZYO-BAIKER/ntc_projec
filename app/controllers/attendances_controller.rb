class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:edit, :update, :destroy]

  def index
    @attendances = Attendance.all.order(date: :desc).page(params[:page]).per(10)
  end

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

  def edit
  end

  def update
    if @attendance.update(attendance_params)
      redirect_to attendances_path
    else
      render :edit
    end
  end

  def destroy
    @attendance.destroy!
    redirect_to attendances_path
  end

  def top
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:date, :client, :construction_site, :departure_time, :arrival_time, :remark, :vehicle, worker_ids: []).tap do |whitelisted|
      whitelisted[:worker_ids] = whitelisted[:worker_ids].reject(&:blank?)
    end
  end
end
