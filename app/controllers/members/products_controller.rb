class Members::ProductsController < Members::BaseController
def index
    @genres = Genre.all
	@products = Product.all
end

def show
@product = Product.find(params[:id])
@cart = Cart.new
end

end
