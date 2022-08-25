class Bookingg < ApplicationRecord
belongs_to :user, optional: false
belongs_to :property
end
