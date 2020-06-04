class Owner::OrderedProductsController < Owner::BaseController
before_action :authenticate_owner!

def update
	@order = Order.find(params[:id])
	@ordered_products = OrderedProduct.find(params[:abc])
	@ordered_products.update(ordered_products_params)
	@orderedproducts = @order.ordered_products


	if @orderedproducts.find_by(production_status: "製作中")
	@order.update(status: "製作中")
	redirect_to owner_order_path(@order.id)
	elsif a = 0
	@orderedproducts.each do |order_product|
	  if ordered_products.production_status == "制作完了"
	    a += 1
	  end
	end
	if a == @orderedproducts.count
	  @order.update(status: "発送準備中")
	  redirect_to owner_order_path(@order.id)
	end
	end
	end

	def order_items_params
	params.require(:order_item).permit(:production_status)
	end
	end

end
