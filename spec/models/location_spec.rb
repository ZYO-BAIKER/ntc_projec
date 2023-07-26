require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Validation" do
    let(:location) { build(:location) }

    context "userが'その他'で、 other_usersが空欄の場合" do
      before do
        location.user = 'その他'
        location.other_users = ''
      end

      it "バリデーションエラー発生" do
        expect(location).not_to be_valid
        expect(location.errors[:other_users]).to include('その他のユーザー名が必要です')
      end
    end

    context "userが'その他'で、 other_usersに入力がある場合" do
      before do
        location.user = 'その他'
        location.other_users = Faker::Name.name
      end

      it "保存に成功する" do
        binding.pry
        expect(location).to be_valid
      end
    end

    context "userが'その他'以外、other_usersが空欄" do
      before do
        location.user = '一般ユーザー'
        location.other_users = ''
      end

      it "保存に成功する" do
        expect(location).to be_valid
      end
    end
  end
end
