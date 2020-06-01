class Owner::ProductsController < ApplicationController
	def index
		@product = Product.find(params[:id])
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
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
