class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :bookinggs
  has_many :properties
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  validates :role_ids, presence: true 
  validates :phone_no, presence: true, length: {maximum: 10} 
end
