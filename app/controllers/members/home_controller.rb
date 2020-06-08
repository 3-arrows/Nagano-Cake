class Members::HomeController < Members::BaseController
	def top
		@genres = Genre.all
		@products = Product.all
	end

	def about
	end

end
