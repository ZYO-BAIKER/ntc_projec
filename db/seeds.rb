require_relative "seeds/workers_data"
require_relative "seeds/vehicle_data"
require_relative "seeds/material_data"

def create_users
  User.create!(account: "admin", authority: 0, password: "admin001")
  User.create!(account: "ntc", authority: 1, password: "227141")
end

def create_workers
  WorkersData::DATA.each do |data|
    Worker.find_or_create_by!(data)
  end
end

def create_vehicles
  VehiclesData::DATA.each do |data|
    Vehicle.find_or_create_by!(data)
  end
end

def create_materials
  MaterialData::DATA.each do |data|
    Material.find_or_create_by!(data)
  end
end

ActiveRecord::Base.transaction do
  create_users
  create_workers
  create_vehicles
  create_materials
end
