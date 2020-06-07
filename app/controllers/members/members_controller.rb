class Members::MembersController < Members::BaseController
	before_action :authenticate_member!
	def show
		@member = current_member
	end

	def edit
		@member = current_member
	end

	def update
		@member = current_member
		if @member.update(member_params)
           redirect_to member_path(current_member), notice: "登録情報を変更しました"
        else
           render "edit"
        end
	end

	def exit
		@member = current_member
	end

	def destroy
		@member = current_member
		@member.destroy
        redirect_to root_path, notice: "退会しました。またのご利用お待ちしております。"
	end

    private

    def member_params
	    params.require(:member).permit(:first_name, :last_name, :first_name_kana,
           :last_name_kana, :postal_code, :prefecture_code, :city, :street, :phone_number, :email)
    end
end

