class Members::ProductsController < Members::BaseController
def index
end

def show
@product = Product.find(params[:id])
@cart = Cart.new
end

end
