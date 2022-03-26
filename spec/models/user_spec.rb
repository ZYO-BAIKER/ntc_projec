require "rails_helper"

RSpec.describe User, type: :model do
  context "必要な情報が揃っている場合" do
    let(:user) { build(:user) }

    it "管理者登録できる" do
      expect(user).to be_valid
    end

    it "ユーザー登録できる" do
      user.authority = 1
      expect(user).to be_valid
    end
  end

  context "authorityが0,1以外" do
    let(:user) { build(:user, authority: 3) }
    it "エラーする" do
      expect(user).not_to be_valid
    end
  end

  context "authorityが無い場合" do
    let(:user) { build(:user, authority: nil) }
    it "エラーする" do
      expect(user).not_to be_valid
    end
  end

  context "accountが無い場合" do
    let(:user) { build(:user, account: nil) }
    it "エラーする" do
      expect(user).not_to be_valid
    end
  end

  context "password がない場合" do
    let(:user) { build(:user, password: nil) }

    it "エラーする" do
      expect(user).not_to be_valid
    end
  end
end
