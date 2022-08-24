class Property < ApplicationRecord
	belongs_to :user
	has_many :bookinggs
end
