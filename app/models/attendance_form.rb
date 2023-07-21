class AttendanceForm
  include ActiveModel::Model

  attr_accessor :attendances

  def initialize(attributes = {})
    @attendances = []
    if attributes["attendances_attributes"]
      self.attendances_attributes = attributes["attendances_attributes"]
    end
    super(attributes.except("attendances_attributes"))
  end

  def attendances_attributes=(attributes)
    @attendances = attributes.values.map do |attendance_attributes|
      # 新しいWorkerのnameが存在する場合には新しいWorkerを作成
      new_worker_name = attendance_attributes.delete("new_worker_name")
      if new_worker_name.present?
        new_worker = Worker.create!(name: new_worker_name, group: :other)
        attendance_attributes["worker_ids"] << new_worker.id.to_s  # 新しいWorkerのidをworker_idsに追加
      end

      attendance_attributes["worker_ids"] = attendance_attributes["worker_ids"].map(&:to_i)
      attendance_attributes["vehicle_ids"] = attendance_attributes["vehicle_ids"].map(&:to_i)
      Attendance.new(attendance_attributes)
    end
  end

  def save
    ActiveRecord::Base.transaction do
      @attendances.each do |attendance|
        next if attendance.attributes.except("date").all? {|_, v| v.blank? }

        attendance.save!
      end
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end
