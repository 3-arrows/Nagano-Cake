class Members::DestinationsController < Members::BaseController
	def index
		@member = current_member
		@destination = Destination.new(destination_params)
		@destinations = Destinations.all.order(created_at: "DESC") #降順
	end

	def create
		@destination = Destination.new(destination_params)
		if @destination.save
		   redirect_to destinations_path(current_member), notice: "配送先を登録しました"
		else
		   render "index"
		end
	end

	def edit
		@destination = Destinaton.find(params[:id])
	end

	def update
		@destination = Destinaton.find(params[:id])
		if @destination.update(destination_params)
		   redirect_to destinations_path(current_member), notice: "配送先を編集しました"
		else
		   render "edit"
		end
	end

	def destroy
		@destination = Destinaton.find(params[:id])
		if @destination.destroy
		   redirect_to destinations_path(current_member), notice: "配送先を削除しました"
		else
		   render "index"
		end
	end

	private

	def destination_params
		params.permit(:member_id, :postal_code, :address, :name)
	end
end
