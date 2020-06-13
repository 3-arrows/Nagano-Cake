class Owner::HomeController < Owner::BaseController
	def top
		today = Time.current.at_beginning_of_day
		to    = today.at_end_of_day
		@orders = Order.where(created_at: today...to)
	end
end
