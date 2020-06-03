class Destination < ApplicationRecord
	belongs_to :member

	def address
		[prefecture_code, city, street].compact.join(',')
	end
end
