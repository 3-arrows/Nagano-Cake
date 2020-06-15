class Owner < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, #registerableがあるとサインアップできてしまう。
		   :recoverable, :rememberable, :validatable
end
