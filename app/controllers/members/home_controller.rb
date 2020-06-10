class Members::HomeController < Members::BaseController
	def top
		@genres = Genre.where(effective_status: true)
		@products = Product.all
	end

	def about
	end
    def search
    #Viewのformで取得したパラメータをモデルに渡す
        @genres = Genre.search(params[:search])
        @products = @genres.product.all
    end

end
