class Location < ApplicationRecord
  belongs_to :material

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select

  validate :other_user_if_needed

  private

    def other_user_if_needed
      if location_user == "その他" && location_other_user.blank?
        errors.add(:location_other_user, "その他のユーザー名が必要です")
      end
    end
end
