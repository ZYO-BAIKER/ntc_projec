class Location < ApplicationRecord
  belongs_to :material

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select, foreign_key: :user_name_id

  validates :place, :use_count, :user_name_id, presence: true
  validates :use_count, numericality: { only_integer: true, greater_than: 0 }
end
