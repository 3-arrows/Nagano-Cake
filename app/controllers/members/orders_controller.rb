class Members::OrdersController < Members::BaseController
	before_action :authenticate_member!
	def new
		@order = Order.new
		@member = current_member
	end

	def create
		@order = Order.new(order_params)
		@order.member_id = current_member.id
		@carts = Cart.all
		if @order.save
		   redirect_to orders_complete_path
		else
		   render "new"
		end
	end

	def index
		@orders = current_member.orders.order(created_at: :desc) #降順
	end

	def show
		@order = Order.find(params[:id])
	end

	def confilm
		@order = Order.new(order_params)
		@member = current_member
	end

	def complete
	end

	private

	def order_params
		params.require(:order).permit(:pay, :postage, :total_price, :postal_code, :prefecture_code, :city, :street, :name, :status, :member_id)
	end
end
