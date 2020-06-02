class Product < ApplicationRecord
	enum sale_status: [1="販売中", 2="売切れ"]
end
