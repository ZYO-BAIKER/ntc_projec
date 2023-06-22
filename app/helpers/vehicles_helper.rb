module VehiclesHelper
  def vehicle_type_label(vehicle_type)
    case vehicle_type
    when "small_car"
      "小型車"
    when "four_ton_unic"
      "4tユニック"
    when "ten_ton_unic"
      "10tユニック"
    when "ten_ton_flat"
      "10t平A/S"
    when "ten_ton_rafter"
      "10tラフター"
    when "light_van"
      "ライトバン他"
    else
      "Unknown Vehicle Type"
    end
  end

  def grouped_vehicles_for_select
    Vehicle.vehicle_types.keys.map do |vehicle_type|
      [vehicle_type_label(vehicle_type), Vehicle.where(vehicle_type: vehicle_type).pluck(:number, :id)]
    end
  end
end
