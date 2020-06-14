class Owner::HomeController < Owner::BaseController
	def top
		today = Date.today.beginning_of_day..Date.today.end_of_day #本日分のデータ
		@orders = Order.where(created_at: today)
	end
end
