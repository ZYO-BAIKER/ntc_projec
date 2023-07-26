class Location < ApplicationRecord
  belongs_to :material

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select

  validate :other_user_if_needed

  private

    def other_user_if_needed
      if user == "その他" && other_users.blank?
        errors.add(:other_users, "その他のユーザー名が必要です")
      end
    end
end
