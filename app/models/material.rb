class Material < ApplicationRecord
  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true, reject_if: :all_blank

  has_one :repair, dependent: :destroy
  accepts_nested_attributes_for :repair

  has_one :purchase, dependent: :destroy
  accepts_nested_attributes_for :purchase

  validates :material_name, :maker, :all_count, :company_count, presence: true
  validate :location_count_within_limit
  # validate :sum_count

  private

    def location_count_within_limit
      if self.locations.size > 3
        errors.add(:base, "最大3つの現場しか保存できません")
      end
    end

    def sum_count
      locations_sum = self.locations.sum(:use_count)
      repair_count = self.repair&.repair_count || 0
      sum = locations_sum + repair_count

      if company_count != all_count - sum
        errors.add(:company_count, "と各数量の合計が合っていません")
      end
    end
end
