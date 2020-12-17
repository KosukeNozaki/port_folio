class Genre < ApplicationRecord
	has_many :cards, dependent: :destroy
end
