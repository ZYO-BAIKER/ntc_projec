class PlaceSelect < ActiveHash::Base
  self.data = [
    { name: "車庫" },
    { name: "現場(入力)" },
  ]

  include ActiveHash::Associations
  has_many :materials
end
