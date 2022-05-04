class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select

  validates :material_name, :all_count, presence: true # 必須設定

  with_options numericality: { allow_blank: true, only_integer: true, greater_than_or_equal_to: 0, message: "は半角で入力して下さい" } do
    validates :all_count, :company_count, :use_count, :use_count2, :use_count3, :repair_count
  end

  validate :sum_count

  def sum_count
    sum = [company_count, use_count, use_count2, use_count3, repair_count]

    if all_count != sum.compact.inject(:+)
      errors.add(:all_count, "と各数量の合計が合っていません")
    end
  end
end
