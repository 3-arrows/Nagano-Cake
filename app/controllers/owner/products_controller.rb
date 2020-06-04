class Owner::ProductsController < Owner::BaseController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		  @product = Product.new(product_params)
		  if @product.sale_status.nil?
		     @product = Product.new
			 render :new
		  else
			   @product.save
		       redirect_to owner_product_path(@product)
		  end
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

	private

	def product_params
		params.require(:product).permit(:name, :information, :price, :image, :sale_status, :genre_id)
	end

end