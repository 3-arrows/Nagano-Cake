class Members::ProductsController < Members::BaseController
def index
    @genres = Genre.all
	@products = Product.all
end

def show
end

end
