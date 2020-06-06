class Member < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable

	has_many :destinations, dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :carts, dependent: :destroy

	#validates :last_name, presence: true, length: {in: 1..10}
	#validates :first_name, presence: true, length: {in: 1..10}
	#validates :last_name_kana, presence: true, length: {in: 1..20}
	#validates :first_name_kana, presence: true, length: {in: 1..20}

	enum member_status: {有効: 0, 退会済: 1}

	def address
		[prefecture_code, city, street].compact.join(',')
	end

	def name
		[last_name, first_name].compact.join(',')
	end

	def name_kana
		[last_name_kana, first_name_kana].compact.join(',')
	end
end
