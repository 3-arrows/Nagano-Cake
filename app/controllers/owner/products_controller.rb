class Owner::ProductsController < Owner::BaseController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to owner_product_path
	end
  
	def product_params
		params.require(:product).permit(:name, :information, :price, :image_id, :sale_status, :genres_id)
	end

end
