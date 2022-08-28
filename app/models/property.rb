class Property < ApplicationRecord
	belongs_to :user
	has_many :bookinggs
	has_many_attached :avatar
end
