class Members::HomeController < Members::BaseController
	def top
		@genres = Genre.where(effective_status: true)
		@products = Product.page(params[:page]).per(4)
	end

	def about
	end

end
