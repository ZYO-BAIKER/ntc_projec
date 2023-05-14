module ApplicationHelper
  def grouped_workers_for_select
    Worker.groups.keys.map do |group|
      [ group, Worker.where(group: group).pluck(:name, :id) ]
    end
  end
end
