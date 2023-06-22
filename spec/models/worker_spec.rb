require "rails_helper"

RSpec.describe Worker, type: :model do
  let(:worker) { FactoryBot.build(:worker) }

  describe "名前の存在性" do
    context "名前がある場合" do
      it "有効な状態であること" do
        expect(worker).to be_valid
      end
    end

    context "名前がない場合" do
      it "無効な状態であること" do
        worker.name = nil
        expect(worker).not_to be_valid
      end
    end
  end

  describe "グループの存在性" do
    context "グループがある場合" do
      it "有効な状態であること" do
        expect(worker).to be_valid
      end
    end

    context "グループがない場合" do
      it "無効な状態であること" do
        worker.group = nil
        expect(worker).not_to be_valid
      end
    end
  end
end
