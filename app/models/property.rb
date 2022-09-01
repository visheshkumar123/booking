class Property < ApplicationRecord
  belongs_to :user
  has_many :bookinggs
  has_one_attached :avatar
end
