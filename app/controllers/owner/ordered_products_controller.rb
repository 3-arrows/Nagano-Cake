class Owner::OrderedProductsController < Owner::BaseController
	before_action :authenticate_owner!
	def update
		@ordered_product = OrderedProduct.find(params[:id])
		@order = @ordered_product.order
		@ordered_product.update(ordered_products_params)
		@orderedproducts = @order.ordered_products
		redirect_to owner_order_path(@order)
	end

	private

	def ordered_products_params
		params.require(:ordered_product).permit(:production_status)
	end
end