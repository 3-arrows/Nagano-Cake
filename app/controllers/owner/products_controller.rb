class Owner::ProductsController < ApplicationController
	def index
		@products = Product.find(params[:id])
	end

	def new
	end

	def show
	end

	def edit
	end

	def create
	end

	def update
	end

end
