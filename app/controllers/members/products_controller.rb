class Members::ProductsController < Members::BaseController
	def index
		@genres = Genre.where(effective_status: true)
		if params[:genre].nil?
			@products = Product.all
        else
        	@products = Product.where(genre_id: params[:genre])
        end
	end

	def show
	    @product = Product.find(params[:id])
	    @cart = Cart.new
	    @genres = Genre.where(effective_status: true)
	end

end
