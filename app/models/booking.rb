class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

# Associations
	belongs_to :user
	belongs_to :property
end