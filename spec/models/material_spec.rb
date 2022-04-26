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

    context "all_countがない場合" do
      let(:material) { build(:material, all_count: nil) }

      it "空欄でエラーする" do
        expect(material).not_to be_valid
      end
    end

    context "数値系が半角自然数でない場合" do
      let(:material) { build(:material) }

      it "全角入力でエラーする" do
        material.all_count = "１２３２"
        expect(material).not_to be_valid
      end

      it "0未満でエラーする" do
        material.company_count = "-1"
        expect(material).not_to be_valid
      end
    end
  end
end
