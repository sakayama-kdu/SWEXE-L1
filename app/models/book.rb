class Book < ApplicationRecord
  validates :title,
            presence: { message: "を入力してください" }

  validates :author,
            presence: { message: "を入力してください" }

  validates :price,
            presence: { message: "を入力してください" },
            numericality: {
              only_integer: true,
              greater_than: 0,
              message: "は正の整数で入力してください"
            }
   def self.human_attribute_name(attr, options = {})
  {
    title: "タイトル",
    author: "著者",
    price: "価格",
    published_on: "出版日"
  }[attr.to_sym] || super
end         
end

