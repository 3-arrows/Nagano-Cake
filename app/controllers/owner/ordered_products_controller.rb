class Owner::OrderedProductsController < Owner::BaseController
	before_action :authenticate_owner! #未ログイン時、閲覧不可
	def update
		@ordered_product = OrderedProduct.find(params[:id])
		@order = @ordered_product.order
		@ordered_product.update(ordered_products_params)
		@orderedproducts = @order.ordered_products
		redirect_to owner_order_path(@order)
		judge = '0'
		if @ordered_product.production_status == '製作中'
				    @order.status = '製作中'
				    @order.save
		elsif @ordered_product.production_status == '製作完了'
			@order.ordered_products.each do |ordered_product|
				if ordered_product.production_status != '製作完了'
					judge = '1'
				end
			end
			if judge == '0'
				@order.status = '発送準備中'
				@order.save
			end
		end
	end

	private

	def ordered_products_params
		params.require(:ordered_product).permit(:production_status)
	end
end