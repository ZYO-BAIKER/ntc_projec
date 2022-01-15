class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select
  belongs_to :place_select

  validates :name, :place, :user, :period, :memo, presence: true # 必須設定
end
