module WorkersHelper
  def group_label(group)
    case group
    when "ntc"
      "NTC"
    when "jsc"
      "JSC"
    when "yamagata"
      "山形工業"
    when "part_time"
      "アルバイト"
    when "seiwah"
      "聖和"
    when "other"
      "その他"
    else
      "Unknown Group"
    end
  end

  def grouped_workers_for_select
    all_workers = Worker.all.pluck(:group, :name, :id)
    Worker.groups.keys.map do |group|
      workers = all_workers.select {|w| w[0] == group }.map {|w| [w[1], w[2]] }
      [group_label(group), workers]
    end
  end
end
