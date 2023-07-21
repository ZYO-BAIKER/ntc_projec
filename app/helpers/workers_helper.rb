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
    Worker.groups.keys.map do |group|
      [group_label(group), Worker.where(group: group).pluck(:name, :id)]
    end
  end
end
