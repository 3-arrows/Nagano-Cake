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
		@new = Order.new(order_params)

		@products = current_member.carts
		#@new.postal_code = current_member.postal_code
		if params[:order][:address] == "0"
		@new.postal_code = current_member.postal_code
		@new.prefecture_code = current_member.prefecture_code
		@new.city = current_member.city
		@new.street = current_member.street
		@new.name = current_member.name
		elsif params[:order][:address] == "1"
		@new.postal_code = current_member.postal_code
		@new.prefecture_code = current_member.prefecture_code
		@new.city = current_member.city
		@new.street = current_member.street
		@new.name = current_member.name
		elsif params[:order][:address] == "2"
		@new.postal_code = params[:order][:new_postal_code]
		@new.prefecture_code = params[:order][:new_prefecture_code]
		@new.city = params[:order][:new_city]
		@new.street = params[:order][:new_street]
		@new.name = params[:order][:new_name]
		end
	end

	def complete
	end

	private

	def order_params
		params.require(:order).permit(:member_id, :pay, :postage, :total_price, :postal_code, :prefecture_code, :city, :street, :name, :status)
	end
end
