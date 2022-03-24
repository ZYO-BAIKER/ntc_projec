class PlaceSelect < ActiveHash::Base
  self.data = [
    { name: "車庫" },
    { name: "第二倉庫" },
    { name: "舞台工場" },
    { name: "修理中" },
    { name: "現場" },
  ]

  include ActiveHash::Associations
  has_many :materials, dependent: :destroy
end
