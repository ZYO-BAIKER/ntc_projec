class PlaceSelect < ActiveHash::Base
  self.data = [
    { name: "車庫" },
    { name: "現場" },
  ]

  include ActiveHash::Associations
  has_many :materials, dependent: :destroy
end