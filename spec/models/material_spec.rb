require "rails_helper"

RSpec.describe Material, type: :model do
  describe "正常系" do
    context "必要な情報が揃っている場合" do
      let(:material) { build(:material) }

      it "資材情報が登録される" do
        expect(material).to be_valid
      end
    end
  end

  describe "異常系" do
    context "material_nameがない場合" do
      let(:material) { build(:material, material_name: nil) }

      it "エラーする" do
        expect(material).not_to be_valid
      end
    end

    context "material_countに異常" do
      let(:material) { build(:material, material_count: nil) }

      it "空欄でエラーする" do
        expect(material).not_to be_valid
      end

      it "全角で入力でエラーする" do
        material.material_count = "１２３２"
        expect(material).not_to be_valid
      end
    end

    context "placeがない場合" do
      let(:material) { build(:material, place: nil) }

      it "エラーする" do
        expect(material).not_to be_valid
      end
    end
  end
end
