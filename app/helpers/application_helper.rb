module ApplicationHelper
	def create_selection_method(destination_data)
		hash = Hash.new
		destination_data.each do |destination|
			str = join_destination(destination.postal_code, destination.prefecture_code, destination.city, destination.street, destination.name)
			hash[str] = destination.id
		end
		return hash
	end
	def join_destination(postal_code, prefecture_code, city, street, name)
		string = String.new
		string = "#{postal_code}"
		string += "#{prefecture_code}"
		string += "#{city}"
		string += "#{street}"
		string += "#{name}"
		return string
	end
end
