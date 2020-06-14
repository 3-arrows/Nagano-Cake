class Owner::OrdersController < Owner::BaseController
	before_action :authenticate_owner! #未ログイン時、閲覧不可
	def index
        if params[:today] == "1"
		    today = Date.today.beginning_of_day..Date.today.end_of_day #本日分のデータ
		    @orders = Order.where(created_at: today).order(created_at: "DESC") #本日分のみ 降順
		elsif params[:member] != nil
			@orders = Order.where(member_id: params[:member])
        else
		    @orders = Order.all.order(created_at: "DESC") #降順
		end
	end

	def show
		@order = Order.find(params[:id])
		@order.postage = POSTAGE_PRICE #POSTAGE_PRICE = application_controllerにて¥800定義済み
	end

	def update
		@order = Order.find(params[:id])
		@order.update(orders_params)
		if @order.status == '入金確認' #注文ステータスが入金確認に変わったら
			@order.ordered_products.each do |ordered_product| #商品が複数あることもあるのでeachを使う
				ordered_product.production_status = '製作待ち' #注文ステータスを製作待ちにする
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