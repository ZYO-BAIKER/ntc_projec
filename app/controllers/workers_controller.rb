class WorkersController < ApplicationController
  include WorkersHelper

  def index
    workers = Worker.all.group_by(&:group).map do |group, workers|
      { name: group_label(group), children: workers.map { |worker| { id: worker.id, name: worker.name } } }
    end
    render json: { workers: workers }
  end
end
