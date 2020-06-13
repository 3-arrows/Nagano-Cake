class Members::ProductsController < Members::BaseController
	def index
		@genres = Genre.where(effective_status: true)
		if params[:genre].nil?
			@products = Product.page(params[:page]).per(8)
        else
        	@products = Product.where(genre_id: params[:genre]).page(params[:page]).per(8)
        end
	end

	def show
	    @product = Product.find(params[:id])
	    @cart = Cart.new
	    @genres = Genre.where(effective_status: true)
	end

end
