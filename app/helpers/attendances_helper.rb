module AttendancesHelper
  def disabled_field_options(attendance)
    attendance.persisted? ? { disabled: true } : {}
  end
end
