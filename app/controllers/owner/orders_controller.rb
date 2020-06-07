class Owner::OrdersController < Owner::BaseController
	def index
		@products = Product.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.update(orders_params)
		@ordered_products = @order.ordered_products.all
		if @order.status == "入金待ち"
		   @ordered_products.each do |ordered_product|
		   order_product.update(production_status: :着手不可)
		   end
		   redirect_to owner_orders_path(@order.id)
		else
		   render :show
		end
	end

	private

	def orders_params
		params.require(:order).permit(:status)
	end
end
