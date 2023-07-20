require "rails_helper"

RSpec.describe Attendance, type: :model do
  let(:attendance) { FactoryBot.build(:attendance) }

  describe "存在性の検証" do
    context "必須項目がすべて存在する場合" do
      it "有効な状態であること" do
        expect(attendance).to be_valid
      end
    end

    context "日付がない場合" do
      it "無効な状態であること" do
        attendance.date = nil
        expect(attendance).not_to be_valid
      end
    end

    context "依頼主がない場合" do
      it "無効な状態であること" do
        attendance.client = nil
        expect(attendance).not_to be_valid
      end
    end

    context "工事場所がない場合" do
      it "無効な状態であること" do
        attendance.construction_site = nil
        expect(attendance).not_to be_valid
      end
    end

    context "作業内容がない場合" do
      it "無効な状態であること" do
        attendance.work_content = nil
        expect(attendance).not_to be_valid
      end
    end
  end
end
