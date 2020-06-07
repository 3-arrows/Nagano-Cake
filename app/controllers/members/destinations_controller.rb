class Members::DestinationsController < Members::BaseController
	def index
		@member = current_member
		@destination = current_member.destinations.new
		@destinations = current_member.destinations.all.order(created_at: "DESC") #降順
	end

	def create
		@destination = Destination.new(address_params)
		@destination.member_id = current_member.id
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
		params.permit(:member_id, :postal_code, :prefecture_code, :city, :street, :name)
	end

	def address_params
		params.require(:destination).permit(:member_id, :postal_code, :prefecture_code, :city, :street, :name)
	end
end
