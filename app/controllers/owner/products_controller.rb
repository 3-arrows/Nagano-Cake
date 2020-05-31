class Owner::ProductsController < ApplicationController
	def index
<<<<<<< HEAD
=======
		@products = Product.find(params[:id])
>>>>>>> 0d169dfee5e7619830fb95df49402fcee3f1843d
	end

	def new
	end

<<<<<<< HEAD
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

	private

	def product_params
		params.require(:product).permit(:name, :information, :price, :image_id, :sale_status, :genres_id)
=======
	def show
	end

	def edit
	end

	def create
	end

	def update
>>>>>>> 0d169dfee5e7619830fb95df49402fcee3f1843d
	end

end
