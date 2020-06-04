class Product < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre

  enum sale_status: {is_saled: 0, not_saled: 1}
  attachment :image
end
