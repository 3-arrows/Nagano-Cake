class Owner::OrdersController < Owner::BaseController
	before_action :authenticate_owner! #未ログイン時、閲覧不可
	def index
		@orders = Order.all.order(created_at: "DESC") #降順
	end

	def show
		@order = Order.find(params[:id])
		@order.postage = POSTAGE_PRICE #POSTAGE_PRICE = application_controllerにて¥800定義済み
	end

	def update
		@order = Order.find(params[:id])
		@order.update(orders_params)
		if @order.status == '入金確認'
			@order.ordered_products.each do |ordered_product|
				ordered_product.production_status = '製作待ち'
				ordered_product.save
			end
		end
		@ordered_products = @order.ordered_products
		redirect_to owner_order_path(@order)
	end

	private

	def orders_params
		params.require(:order).permit(:status)
	end
end