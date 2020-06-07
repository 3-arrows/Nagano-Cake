class Members::OrdersController < Members::BaseController
	before_action :authenticate_member!
	def new
		@order = Order.new
		@destination = Destination.new
	end

	def create
		@order = current_member.order.new(order_params)
		if @order.save
		   redirect_to orders_complete_path
		else
		   render "new"
		end
		if params[:address] == 0
		elsif paramas[]
		end
		current_member.carts.each do |cart|
			@ordered_product = @order.ordered_products.build
			@ordered_product.product_id = cart.product_id
			@ordered_product.price = cart.product.price
			@ordered_product.count = cart.count
			@ordered_product.production_status = 0
			@ordered_product.save
			cart.destroy
		end
	end

	def index
		@orders = current_member.orders.order(created_at: "DESC") #降順
	end

	def show
		@order = Order.find(params[:id])
	end

	def confirm
		@order = current_member.orders.new(order_params)
		@ordered_products = current_member.ordered_product.all
	end

	def complete
	end

	private

	def order_params
		params.require(:order).permit(:member_id, :pay, :postage, :total_price, :postal_code, :prefecture_code, :city, :street, :name, :status)
	end
end
