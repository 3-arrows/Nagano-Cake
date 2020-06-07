class Destination < ApplicationRecord
	belongs_to :member

	def address
		prefecture_code + city + street
	end
end
