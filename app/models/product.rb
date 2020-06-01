class Product < ApplicationRecord
	enum sale_status: {is_saled: 0, not_saled: 1}
	attachment :image
end
