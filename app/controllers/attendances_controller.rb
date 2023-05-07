class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all.order("created_at DESC").page(params[:page]).per(10)
  end
end
