class Members::HomeController < Members::BaseController
	def top
		@genres = Genre.all
	end

	def about
	end

end
