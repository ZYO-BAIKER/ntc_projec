class UserSelect < ActiveHash::Base
  self.data = [
    { name: "吉久保" },
    { name: "加藤" },
    { name: "小沢" },
    { name: "近藤" },
    { name: "笹沼" },
    { name: "小川" },
    { name: "宮下" },
    { name: "古川" },
    { name: "大越" },
    { name: "山品" },
    { name: "石川" },
    { name: "長谷川" },
    { name: "皆川" },
    { name: "大友" },
    { name: "聖和" },
    { name: "山形工業" },
    { name: "裕建" },
    { name: "その他(入力)" },
  ]

  include ActiveHash::Associations
  has_many :materials, dependent: :destroy
end
