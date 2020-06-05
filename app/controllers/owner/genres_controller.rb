class Owner::GenresController < Owner::BaseController
    before_action :authenticate_owner!
    def index
        @genres = Genre.all
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
           redirect_to owner_genres_path, notice: "ジャンルを追加しました"
        else
           render "index"
        end
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        redirect_to owner_genres_path
    end

    private

    def genre_params
        params.require(:genre).permit(:name, :effective_status)
    end
end
