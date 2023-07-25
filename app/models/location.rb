class Location < ApplicationRecord
  belongs_to :material

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select

  validate :material_locations_within_limit
  validate :other_user_if_needed

  private

    def material_locations_within_limit
      if self.material.locations.size >= 3
        errors.add(:base, "同一の物資に関連付けられる現場は最大3つまでです")
      end
    end

    def other_user_if_needed
      if user == "その他" && other_users.blank?
        errors.add(:other_users, "その他のユーザー名が必要です")
      end
    end
end
