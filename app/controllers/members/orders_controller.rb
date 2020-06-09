class Members::OrdersController < Members::BaseController
	before_action :authenticate_member!
	def new
		@order = Order.new
		@destination = Destination.new
	end

	def create
		@order = current_member.orders.new(order_params)
		@member = current_member
		if @order.save
		   redirect_to order_complete_path
		else
		   render "new"
		end
		if params[:address] == 0
		elsif params[]
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
		@registered_address = Destination.new(destination_params)
		@registered_address.member_id = current_member.id
		@registered_address.save
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
		@order.postage = POSTAGE_PRICE
		@products = current_member.carts
		if params[:order][:address] == "0"
		   @new.postal_code = current_member.postal_code
		   @new.prefecture_code = current_member.prefecture_code
		   @new.city = current_member.city
		   @new.street = current_member.street
		   @new.name = current_member.last_name + current_member.first_name
		elsif params[:order][:address] == "1"
		   @registered_address = Destination.find(params[:order][:destination])
		   @new.postal_code = @registered_address.postal_code
		   @new.prefecture_code = @registered_address.prefecture_code
		   @new.city = @registered_address.city
		   @new.street = @registered_address.street
		   @new.name = @registered_address.name
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
