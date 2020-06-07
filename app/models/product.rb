class Product < ApplicationRecord
    has_many :carts, dependent: :destroy
    has_many :ordered_products, dependent: :destroy
    belongs_to :genre
    attachment :image
    enum sale_status: {販売中: 0, 売切れ: 1}
end
