class Members::OrdersController < Members::BaseController
	before_action :authenticate_member!
	def new
		@order = Order.new
	end

	def create
		@order = current_member.order.new(order_params)
		if @order.save
		   redirect_to orders_complete_path
		else
		   render "new"
		end
	end

	def index
		@orders = current_member.orders.order(created_at: "DESC") #降順
	end

	def show
		@order = Order.find(params[:id])
	end

	def confilm
		@order = current_member.order.new(order_params)
		@ordered_products = current_member.ordered_product.all
	end

	def complete
	end

	private

	def order_params
		params.require(:order).permit(:member_id, :pay, :postage, :total_price, :postal_code, :address, :name, :status)
	end
end
