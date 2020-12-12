class Address < ApplicationRecord
	belongs_to :customer
	def registration_address
		"〒#{self.postal_code}#{self.address}#{self.name}"
	end
end
