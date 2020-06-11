class Owner::OrdersController < Owner::BaseController
	before_action :authenticate_owner!
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order.postage = POSTAGE_PRICE
	end

	def update
		@order = Order.find(params[:id])
		@order.update(orders_params)
		@ordered_products = @order.ordered_products
		redirect_to owner_order_path(@order)
	end

	private

	def orders_params
		params.require(:order).permit(:status)
	end
end
