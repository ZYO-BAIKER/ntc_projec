class Material < ApplicationRecord
  validates :name, :place, :user, :period, :memo, presence: true # 必須設定
end
