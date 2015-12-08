class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :length,
		presence: true
# Associations
	belongs_to :user
	belongs_to :property
end