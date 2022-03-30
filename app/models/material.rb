class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select
  belongs_to :place_select

  validates :material_name, :material_count, :place, :use_count, presence: true # 必須設定
  validates :material_count, numericality: { with: /\A[0-9]+\z/, message: "は半角で入力して下さい" } # 半角必須
end
