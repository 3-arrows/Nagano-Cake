class Genre < ApplicationRecord
    has_many :products
    validates :name, presence: true
    enum effective_status: {true: true, false: false}
  validates :genre ,presence: true
  validates :effective_status, presence: true
end
