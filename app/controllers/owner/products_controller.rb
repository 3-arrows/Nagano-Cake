class Owner::ProductsController < ApplicationController
	def index
	end

	def new
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def create
	end

	def update
	end

end
