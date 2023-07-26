require "rails_helper"

RSpec.describe Location, type: :model do
  describe "Validation" do
    let(:location) { build(:location) }

    context "location_userが'その他'で、 location_other_userが空欄の場合" do
      before do
        location.location_user = "その他"
        location.location_other_user = ""
      end

      it "バリデーションエラー発生" do
        expect(location).not_to be_valid
        expect(location.errors[:location_other_user]).to include("その他のユーザー名が必要です")
      end
    end

    context "userが'その他'で、 location_other_userに入力がある場合" do
      before do
        location.location_user = "その他"
        location.location_other_user = Faker::Name.name
      end

      it "保存に成功する" do
        expect(location).to be_valid
      end
    end

    context "userが'その他'以外、location_other_userが空欄" do
      before do
        location.location_user = "一般ユーザー"
        location.location_other_user = ""
      end

      it "保存に成功する" do
        expect(location).to be_valid
      end
    end
  end
end
