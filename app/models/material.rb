class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_select

  validates :material_name, :all_count, presence: true # 必須設定

  with_options numericality: { with: /\A[0-9]+\z/, message: "は半角で入力して下さい" } do
    validates :all_count
  end
end
