class Location < ApplicationRecord
  belongs_to :material

  validates :place, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select

  validates :use_count, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "は半角で入力して下さい" }, allow_blank: true
end
