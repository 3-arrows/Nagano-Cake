class Owner::MembersController < Owner::BaseController
	before_action :authenticate_owner!
	def index
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update(member_params)
		   redirect_to owner_member_path, notice: "会員情報を変更しました"
		else
		   render "edit"
		end
	end

	private

	def member_params
		params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :password, :member_status)
	end

end
