class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select

  validates :name, :place, :user, :period_start, :memo, presence: true # 必須設定
end
