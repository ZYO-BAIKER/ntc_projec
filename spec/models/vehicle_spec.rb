require "rails_helper"

RSpec.describe Vehicle, type: :model do
  let(:vehicle) { FactoryBot.build(:vehicle) }

  describe "ナンバーの存在性" do
    context "ナンバーがある場合" do
      it "有効な状態であること" do
        expect(vehicle).to be_valid
      end
    end

    context "ナンバーがない場合" do
      it "無効な状態であること" do
        vehicle.number = nil
        expect(vehicle).not_to be_valid
      end
    end
  end

  describe "車両タイプの存在性" do
    context "車両タイプがある場合" do
      it "有効な状態であること" do
        expect(vehicle).to be_valid
      end
    end

    context "車両タイプがない場合" do
      it "無効な状態であること" do
        vehicle.vehicle_type = nil
        expect(vehicle).not_to be_valid
      end
    end
  end
end
