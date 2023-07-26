require "rails_helper"

RSpec.describe Material, type: :model do
  let(:material) { FactoryBot.build(:material) }

  context "バリデーションテスト" do
    it "ensures material_name presence" do
      material.material_name = nil
      expect(material.valid?).to eq(false)
    end

    it "ensures maker presence" do
      material.maker = nil
      expect(material.valid?).to eq(false)
    end

    it "ensures all_count presence" do
      material.all_count = nil
      expect(material.valid?).to eq(false)
    end

    it "ensures company_count presence" do
      material.company_count = nil
      expect(material.valid?).to eq(false)
    end

    it "ensures company_count is 0 or more" do
      material.company_count = -1
      expect(material.valid?).to eq(false)
    end

    it "ensures material can't have more than 3 locations" do
      4.times do
        material.locations.build(place: Faker::Address.city, user: UserSelect.data.sample[:name], usage_count: 1)
      end
      expect(material.valid?).to eq(false)
    end

    it "is able to save material" do
      expect(material.save).to eq(true)
    end
  end
end
