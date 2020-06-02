class Members::CartsController < Members::BaseController
  before_action :authenticate_member!
  def index
  	@carts = current_member.carts
  end

	def create
		@cart = Cart.new(cart_params)
    @cart.member_id = current_member.id
    @current_cart = Cart.find_by(product_id: @cart.product_id,member_id: @cart.member_id)
    if @current_cart.nil?
        if @cart.save
            redirect_to carts_path, notice: "カートに商品が追加されました。"
        else
            @carts = current_member.carts
            render 'index'
        end
    else
        added_carts = @current_cart.count + params[:cart][:count].to_i
        @current_cart.update(count: added_carts)
        redirect_to carts_path
    end
	end

	def update
		@cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to carts_path
	end

	def destroy
		cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
	end

	def destroy_all
		@cart = current_member.carts
    @cart.destroy_all
    redirect_to carts_path, notice: "カートが空になりました。"
	end

	private

  def cart_params
      params.require(:cart).permit(:count,:product_id)
  end

end