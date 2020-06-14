class Owner::OrderedProductsController < Owner::BaseController
	before_action :authenticate_owner! #未ログイン時、閲覧不可
	def update
		@ordered_product = OrderedProduct.find(params[:id])
		@order = @ordered_product.order
		@ordered_product.update(ordered_products_params)
		@orderedproducts = @order.ordered_products
		redirect_to owner_order_path(@order)
		judge = '0' #後で使うために定義
		if @ordered_product.production_status == '製作中' #注文商品のステータスが製作中になったら
				    @order.status = '製作中'
				    @order.save
		elsif @ordered_product.production_status == '製作完了' #注文商品のステータスが製作完了になったら
			@order.ordered_products.each do |ordered_product| #すべての注文商品のステータスが製作完了になっているか確認するためにeachを使う
				if ordered_product.production_status != '製作完了' #ひとつでも注文商品のステータスが製作完了になっていなかったら
					judge = '1' #1を入れる
				end
			end
			if judge == '0' #0 = 注文商品のステータスが製作完了になっていないものが一つもなければ
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