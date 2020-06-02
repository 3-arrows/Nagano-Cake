class Order < ApplicationRecord
	belongs_to :member
	has_many :ordered_products, dependent: :destroy
	enum pay: { クレジットカード: 1, 銀行振り込み: 2 }
	enum status:  { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
end
