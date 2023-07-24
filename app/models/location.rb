class Location < ApplicationRecord
  belongs_to :material

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select, foreign_key: :user_name_id
end
