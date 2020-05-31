class Owner::ProductsController < ApplicationController
	def index
	end

	def new
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

	private

	def product_params
		params.require(:product).permit(:name, :information, :price, :image_id, :sale_status, :genres_id)
	end

end
