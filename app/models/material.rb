class Material < ApplicationRecord
  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true, reject_if: :all_blank

  has_one :repair, dependent: :destroy
  accepts_nested_attributes_for :repair

  has_one :purchase, dependent: :destroy
  accepts_nested_attributes_for :purchase

  validates :material_name, :maker, :all_count, :company_count, presence: true
  validates :company_count, numericality: { greater_than_or_equal_to: 0, message: "は0以上である必要があります" }
  validate :location_count_within_limit

  private

    def location_count_within_limit
      if self.locations.size > 3
        errors.add(:base, "最大3つの現場しか保存できません")
      end
    end
end
