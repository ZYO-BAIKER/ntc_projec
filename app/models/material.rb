class Material < ApplicationRecord
  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true, reject_if: :all_blank

  has_one :repair, dependent: :destroy
  accepts_nested_attributes_for :repair

  has_one :purchase, dependent: :destroy
  accepts_nested_attributes_for :purchase

  validates :material_name, :all_count, presence: true

  with_options numericality: { allow_blank: true, only_integer: true, greater_than_or_equal_to: 0, message: "は半角で入力して下さい" } do
    validates :all_count, :company_count
  end

  # validate :sum_count

  # def sum_count
  #   locations_sum = self.locations.map(&:use_count).compact.sum
  #   repair_count = self.repair&.repair_count || 0
  #   sum = locations_sum + repair_count

  #   if all_count != sum
  #     errors.add(:all_count, "と各数量の合計が合っていません")
  #   end
  # end
end
